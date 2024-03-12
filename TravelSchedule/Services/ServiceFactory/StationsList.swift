//
//  StationsListService.swift
//  TravelSchedule
//
//  Created by Ognerub on 12.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession
import SwiftSoup

typealias StationsList = Components.Schemas.StationsList
typealias Country = StationsList.countriesPayloadPayload
typealias Region = Country.regionsPayloadPayload
typealias Settlement = Region.settlementsPayloadPayload
typealias Station = Settlement.stationsPayloadPayload
typealias StationCode = Station.codesPayload

private enum NetworkErrorType: Error {
    case invalidHTMLResponse
    case htmlParsingError
    case invalidJSONResponse
    case jsonConversionError
}

protocol StationsListServiceProtocol {
    func getStationsList() async throws -> StationsList
}

final class StationsListService: StationsListServiceProtocol, APIService {
    
    var client: Client
    var apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getStationsList() async throws -> StationsList {
        let response = try await client.getStationsList(
            query: .init(
                apikey: apikey,
                lang: "ru_RU",
                format: "json"
            )
        )
        
        do {
            let htmlContent = try response.ok.body.html
            
            let htmlString = try convertHTMLContentToString(htmlContent, response: response)
            
            let stationsList = try parseHTML(htmlString)
            return stationsList
        } catch {
            throw NetworkErrorType.htmlParsingError
        }
    }
    
    private func convertHTMLContentToString(_ htmlContent: HTTPBody, response: Operations.getStationsList.Output) throws -> String {
        do {
            let json = try response.ok.body.json
            guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []),
                  let jsonString = String(data: jsonData, encoding: .utf8) else {
                throw NetworkErrorType.invalidJSONResponse
            }

            return jsonString
        } catch {
            throw NetworkErrorType.jsonConversionError
        }
    }
    
    func parseHTML(_ htmlString: String) throws -> StationsList {
            do {
                // Parse HTML using SwiftSoup
                let doc = try SwiftSoup.parse(htmlString)
                
                // Extract information from the HTML document
                // This is a basic example; adjust it based on your HTML structure
                
                // Extract countries
                let countriesElements = try doc.select("your_country_selector")
                var countries: [Country] = []
                
                for countryElement in countriesElements {
                    // Extract country information
                    let countryCode = try countryElement.attr("your_country_code_attribute")
                    let countryTitle = try countryElement.text()
                    
                    // Extract regions
                    let regionsElements = try countryElement.select("your_region_selector")
                    var regions: [Region] = []
                    
                    for regionElement in regionsElements {
                        let regionCode = try regionElement.attr("your_region_code_attribute")
                        let regionTitle = try regionElement.text()
                        
                        // Extract settlements
                        let settlementsElements = try regionElement.select("your_settlement_selector")
                        var settlements: [Settlement] = []
                        
                        for settlementElement in settlementsElements {
                            let settlementCode = try settlementElement.attr("your_settlement_code_attribute")
                            let settlementTitle = try settlementElement.text()
                            
                            // Extract stations
                            let stationsElements = try settlementElement.select("your_station_selector")
                            var stations: [Station] = []
                            for stationElement in stationsElements {
                                let stationCode = try stationElement.attr("your_station_code_attribute")
                                let stationTitle = try stationElement.text()
                                let station = Station(
                                    codes: StationCode(yandex_code: stationCode),
                                    title: stationTitle
                                )
                                stations.append(station)
                            }
                            
                            // Create Settlement instance and add to settlements array
                            let settlement = Settlement(title: settlementTitle, stations: stations)
                            settlements.append(settlement)
                        }
                        
                        // Create Region instance and add to regions array
                        let region = Region(settlements: settlements, title: regionTitle)
                        regions.append(region)
                    }
                    
                    // Create Country instance and add to countries array
                    let country = Country(regions: regions, title: countryTitle)
                    countries.append(country)
                }
                
                // Create StationsList instance
                let stationsList = StationsList(countries: countries)
                
                return stationsList
                
            } catch {
                throw NetworkErrorType.htmlParsingError
            }
        }
}




