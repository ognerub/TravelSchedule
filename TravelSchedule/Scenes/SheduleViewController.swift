//
//  ViewController.swift
//  TravelSchedule
//
//  Created by Ognerub on 3/9/24.
//

import UIKit
import OpenAPIURLSession

final class SheduleViewController: UIViewController {
    
    private var uiBlockingProgressHUD: UIBlockingProgressHUDProtocol?
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .blackDay
        label.frame = CGRect(x: 100, y: 100, width: 200, height: 400)
        label.numberOfLines = 999
        label.lineBreakMode = .byWordWrapping
        label.text = "Loading"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteDay
        view.addSubview(label)
        uiBlockingProgressHUD = UIBlockingProgressHUD(viewController: self)
        uiBlockingProgressHUD?.showCustom()
    }

    private func nearestStations() {
        guard let service = create(service: .nearestStations) as? NearestStationsService else { return }
        Task {
            let stations = try await service.getNearestStations(
                lat: 59.864177,
                lng: 30.319163,
                distance: 50
            )
            print(stations)
            label.text = "\(stations)"
            uiBlockingProgressHUD?.dismissCustom()
        }
    }
    
    private func pointToPoint() {
        guard let service = create(service: .pointToPoint) as? PointToPointService else { return }
        Task {
            let pointToPoint = try await service.getPointToPoint(
                from: "c146",
                to: "c213",
                page: "1",
                date: "2024-03-11"
            )
            print(pointToPoint)
            label.text = "\(pointToPoint)"
            uiBlockingProgressHUD?.dismissCustom()
        }
    }
    
    private func scheduleOnStation() {
        guard let service = create(service: .scheduleOnStation) as? ScheduleOnStationService else { return }
        Task {
            let schedule = try await service.getScheduleOnStation(
                station: "s9600213",
                date: "2024-03-12"
            )
            print(schedule)
            label.text = "\(schedule)"
            uiBlockingProgressHUD?.dismissCustom()
        }
    }
    
    private func threadInformation() {
        guard let service = create(service: .threadInformation) as? ThreadInformationService else { return }
        Task {
            let threadInfo = try await service.getThreadInformation(uid: "068S_10_2", show: "all")
            print(threadInfo)
            label.text = "\(threadInfo)"
            uiBlockingProgressHUD?.dismissCustom()
        }
    }
    
    private func nearestSettlement() {
        guard let service = create(service: .nearestSettlement) as? NearestSettlementService else { return }
        Task {
            let settlement = try await service.getNearestSettlement(lat: 50.440046, lng: 40.48822367, distance: 50)
            print(settlement)
            label.text = "\(settlement)"
            uiBlockingProgressHUD?.dismissCustom()
        }
    }
    
    private func carriersInformation() {
        guard let service = create(service: .carriersInformation) as? CarriersInformationService else { return }
        Task {
            let carriers = try await service.getCarriersInformation(code: "TK", system: "iata")
            print(carriers)
            label.text = "\(carriers)"
            uiBlockingProgressHUD?.dismissCustom()
        }
    }
    
    private func stationsList() {
        guard let service = create(service: .stationsList) as? StationsListService else { return }
        Task {
            do {
                let response = try await service.getListOfAllStations()
                let countries: [Countries] = response.countries ?? []
                let regions: [Regions] = countries.flatMap{ $0.regions ?? [] }
                let settlements: [Settlements] = regions.flatMap { $0.settlements ?? [] }
                let stations: [Stations] = settlements.flatMap { $0.stations ?? [] }
                label.text = String(
                    """
                    Countries count \(countries.count)
                    Regions count \(regions.count)
                    Settlements count \(settlements.count)
                    Stations count \(stations.count)
                    """
                )
                uiBlockingProgressHUD?.dismissCustom()
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("❌ ERROR: \(error.localizedDescription)")
                }
        }
    }
}

private extension SheduleViewController {
    func create(service: ServiceType) -> APIService? {
        guard let url = try? Servers.server1() else {
            print("error url")
            return nil
        }
        let client = Client(
            serverURL: url,
            transport: URLSessionTransport()
        )
        let service = ServiceFactory.createService(
            type: service,
            client: client
        )
        return service
    }
}

