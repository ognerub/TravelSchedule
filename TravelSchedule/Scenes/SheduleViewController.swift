//
//  ViewController.swift
//  TravelSchedule
//
//  Created by Ognerub on 3/9/24.
//

import UIKit
import OpenAPIURLSession

final class SheduleViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .blackDay
        label.frame = CGRect(x: 100, y: 100, width: 200, height: 400)
        label.numberOfLines = 999
        label.lineBreakMode = .byWordWrapping
        label.text = "label"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteDay
        view.addSubview(label)
        //nearestStations()
        //pointToPoint()
        scheduleOnStation()
    }

    private func nearestStations() {
        guard let service = create(service: .nearestStations) as? NearestStationsService else { return }
        Task {
            let stations = try await service.getNearestStations(
                lat: 59.864177,
                lng: 30.319163,
                distance: 50
            )
            label.text = "\(stations)"
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
            label.text = "\(pointToPoint)"
        }
    }
    
    private func scheduleOnStation() {
        guard let service = create(service: .scheduleOnStation) as? ScheduleOnStationService else { return }
        Task {
            let schedule = try await service.getScheduleOnStation(station: "s9600213", date: "2024-03-12")
            label.text = "\(schedule)"
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

