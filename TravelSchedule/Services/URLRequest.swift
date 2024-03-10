//
//  URLRequest.swift
//  TravelSchedule
//
//  Created by Ognerub on 10.03.2024.
//

import Foundation

final class URLRequestBuilder {
    
    static let shared = URLRequestBuilder()
    
    private func makeBaseRequestAndURL(
        path: String,
        httpMethod: String,
        baseURLString: String
    ) -> (URLRequest, URL) {
        let emptyURL = URL(fileURLWithPath: "")
        guard
            baseURLString.isValidURL,
            let url = URL(string: baseURLString),
            let baseURL = URL(string: path, relativeTo: url)
        else {
            assertionFailure("Impossible to create URLRequest of URL")
            return (URLRequest(url: emptyURL), emptyURL)
        }
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = httpMethod
        request.timeoutInterval = 15
        return (request, baseURL)
    }
    
    func makeSearchHTTPRequest (
        path: String,
        httpMethod: String,
        baseURLString: String) -> URLRequest? {
            let simpleRequest = makeBaseRequestAndURL(
                path: path,
                httpMethod: httpMethod,
                baseURLString: baseURLString)
            var request: URLRequest = simpleRequest.0
            let baseURL: URL = simpleRequest.1
            
            var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
            components?.queryItems = [
                URLQueryItem(name: "q", value: "value")
            ]
            guard let comurl = components?.url else {
                print("error to create url")
                return nil
            }
            request.url = comurl
            return request
        }
}

