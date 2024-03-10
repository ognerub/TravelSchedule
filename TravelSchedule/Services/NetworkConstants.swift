//
//  NetworkConstants.swift
//  TravelSchedule
//
//  Created by Ognerub on 10.03.2024.
//

import Foundation

let apiKey = "341101e3-a890-4cf6-805a-8a77c42a6c12"
let baseUrl = "https://api.rasp.yandex.net/"

struct NetworkConstants {
    
    let base: String
    let key: String
    
    init(
        base: String,
        key: String
    ) {
        self.base = base
        self.key = key
    }
    
    static var standart: NetworkConstants {
        return NetworkConstants(
            base: baseUrl,
            key: apiKey
        )
    }
}
