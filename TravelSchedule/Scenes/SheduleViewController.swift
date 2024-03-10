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
        stations()
    }
    
    func stations() {
        
        guard let url = try? Servers.server1() else {
            print("error url")
            return
        }
        
        let client = Client(
            serverURL: url,
            transport: URLSessionTransport()
        )

        let service = NearestStationsService(
            client: client,
            apikey: "341101e3-a890-4cf6-805a-8a77c42a6c12"
        )

        Task {
            let stations = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
            print(stations)
        }
    }
}

