//
//  ViewController.swift
//  TravelSchedule
//
//  Created by Ognerub on 3/9/24.
//

import UIKit
import OpenAPIURLSession

class SheduleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteDay
        //stations()
        pointToPoint()
    }
    
//    private func stations() {
//        guard let client = createClient() else { return }
//        let service = NearestStationsService(
//            client: client,
//            apikey: NetworkConstants.apiKey
//        )
//        Task {
//            let stations = try await service.getNearestStations(
//                lat: 59.864177,
//                lng: 30.319163,
//                distance: 50
//            )
//            print(stations)
//        }
//    }
    
    private func pointToPoint() {
        guard let client = createClient() else { return }
        let service = PointToPointService(
            client: client,
            apikey: NetworkConstants.apiKey
        )
        Task {
            let pointToPoint = try await service.getPointToPoint(
                from: "c146",
                to: "c213",
                page: "1",
                date: "2024-03-11"
            )
            print(pointToPoint)
        }
    }
    
    private func createClient() -> Client?  {
        guard let url = try? Servers.server1() else {
            print("error url")
            return nil
        }
        let client = Client(
            serverURL: url,
            transport: URLSessionTransport()
        )
        return client
    }
}

