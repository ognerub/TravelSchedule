//
//  TransportService.swift
//  TravelSchedule
//
//  Created by Ognerub on 10.03.2024.
//

import Foundation

final class TransportService {
    
    static let ResultDidChangeNotification = Notification.Name(rawValue: "SearchResultDidChange")
    
    static let shared = TransportService()
    
    private let urlSession: URLSession
    private let builder: URLRequestBuilder
    
    private var currentTask: URLSessionTask?
    private (set) var apiResponse: ApiResponse?
    
    init (
        urlSession: URLSession = .shared,
        builder: URLRequestBuilder = .shared
    ) {
        self.urlSession = urlSession
        self.builder = builder
    }
    
    func fetchStations(completion: @escaping (Result<ApiResponse, Error>) -> Void) {
        if currentTask != nil { return } else { currentTask?.cancel() }
        guard let request = urlRequest() else {
            completion(.failure(NetworkError.urlSessionError))
            return
        }
        currentTask = urlSession.objectTask(for: request) { [weak self] (result: Result<ApiResponse,Error>) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.currentTask = nil
                switch result {
                case .success(let result):
                    self.apiResponse = result
                    NotificationCenter.default.post(
                        name: TransportService.ResultDidChangeNotification,
                        object: self,
                        userInfo: ["ApiResponse": result]
                    )
                    completion(.success(result))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        currentTask?.resume()
    }
}

private extension TransportService {
    func urlRequest() -> URLRequest? {
        let path: String = "/search?"
        return builder.makeSearchHTTPRequest(
            path: path,
            httpMethod: "GET",
            baseURLString: NetworkConstants.standart.base
        )
    }
}
