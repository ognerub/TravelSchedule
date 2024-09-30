//
//  CarriersListViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

@MainActor
final class RoutesListViewModel: Sendable, ObservableObject {

    let fromCode: String
    let toCode: String
    let fromToString: String

    private let networkService: NetworkServiceProtocol
    private let dateManager = DateManager()

    @Published var routesArray = [RouteModel]()
    @Published var isLoading: Bool = false

    init(fromCode: String, toCode: String, fromToString: String, networkService: NetworkServiceProtocol) {
        self.fromCode = fromCode
        self.toCode = toCode
        self.fromToString = fromToString
        self.networkService = networkService
    }

    func isAnyFilterOff(isMorningFilterOn: Bool, isAfternoonFilterOn: Bool, isEveningFilterOn: Bool, isNightFilterOn: Bool, isTransfersFilterOn: Bool) -> Bool {
        let summ: Int = (isMorningFilterOn ? 0 : 1) +
        (isAfternoonFilterOn ? 0 : 1) +
        (isEveningFilterOn ? 0 : 1) +
        (isNightFilterOn ? 0 : 1) +
        (isTransfersFilterOn ? 0 : 1)
        return summ > 0 ? true : false
    }

    func getFilteredRoutes(isMorningFilterOn: Bool, isAfternoonFilterOn: Bool, isEveningFilterOn: Bool, isNightFilterOn: Bool, isTransfersFilterOn: Bool) -> [RouteModel] {
        let startArray = routesArray
        let morningArray = isMorningFilterOn ? startArray.filter {
            guard let prefix = Int($0.startTime.prefix(2)) else { return false }
            if (prefix >= 6 && prefix < 12) { return true } else { return false }
        } : []
        let afternoonArray = isAfternoonFilterOn ? startArray.filter {
            guard let prefix = Int($0.startTime.prefix(2)) else { return false }
            if (prefix >= 12 && prefix < 18) { return true } else { return false }
        } : []
        let eveningArray = isEveningFilterOn ? startArray.filter {
            guard let prefix = Int($0.startTime.prefix(2)) else { return false }
            if (prefix >= 18 && prefix < 24) { return true } else { return false }
        } : []
        let nigthArray = isNightFilterOn ? startArray.filter {
            guard let prefix = Int($0.startTime.prefix(2)) else { return false }
            if (prefix >= 0 && prefix < 6) { return true } else { return false }
        } : []
        let summArray = morningArray + afternoonArray + eveningArray + nigthArray
        var finalArray = isTransfersFilterOn ? summArray : summArray.filter {
            $0.transfer == ""
        }
        finalArray.sort(by: { $0.date.prefix(2) < $1.date.prefix(2) } )
        return finalArray
    }

    func pointToPoint() async {
        isLoading = true
        do {
            guard let service = await networkService.createPointToPointService() else { return }
            let todayDateString = dateManager.getString(from: Date())
            let pointToPoint = try await service.getPointToPoint(
                from: fromCode,
                to: toCode,
                page: "1",
                date: todayDateString
            )
            if let segments = pointToPoint.segments {
                segments.forEach { segment in
                    let route = createRoute(from: segment)
                    routesArray.append(route)
                }
            }
            isLoading = false
        } catch {
            print("error \(error.localizedDescription)")
            isLoading = false
        }
    }

    private func createRoute(from segment: Components.Schemas.PointToPoint.segmentsPayloadPayload) -> RouteModel {
        var transferDuration: Int = 0
        if let details = segment.details {
            details.forEach {
                transferDuration += $0.duration ?? 0
            }
        }
        let hours: Int = Int((Double(segment.duration ?? transferDuration) / 60 / 60).rounded(.up))
        var transferPoint: String = ""
        if let transfer = segment.details?.first?.to?.title {
            transferPoint = transfer
        }
        var transferCarrier: String?
        if let carrier = segment.details?.first?.thread?.carrier?.title {
            transferCarrier = carrier
        }
        return RouteModel(
            id: UUID(),
            logo: (
                segment.thread?.carrier?.logo_svg ?? segment.thread?.carrier?.logo ?? "",
                segment.thread?.carrier?.logo_svg != nil ? LogoImageType.svg : LogoImageType.jpg
            ),
            transfer: segment.has_transfers ?? false ? "\(Localization.Schedule.transfer) \(transferPoint)" : "",
            date: dateManager.getLocalizedShortDate(from: segment.start_date) ?? dateManager.getLocalizedDate(from: segment.departure) ?? "",
            startTime: dateManager.getLocalizedTime(from: segment.departure) ?? "",
            endTime: dateManager.getLocalizedTime(from: segment.arrival) ?? "",
            duration: String.localizedStringWithFormat(NSLocalizedString("durationHours",
                                                                         comment: ""), hours),
            companyTitle: segment.thread?.carrier?.title ?? transferCarrier ?? Localization.CarrierCardView.empty,
            companyPhone: segment.thread?.carrier?.phone ?? Localization.CarrierCardView.empty,
            companyEmail: segment.thread?.carrier?.email ?? Localization.CarrierCardView.empty
        )
    }
}
