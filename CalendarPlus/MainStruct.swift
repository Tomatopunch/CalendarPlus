//
//  MainStruct.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-29.
//  Copyright © 2019 Project_E. All rights reserved.
//

import Foundation
// MARK: - Main
struct Main: Codable {
    
    let temp: Double
    let pressure, humidity, tempMin: Int
    let tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
