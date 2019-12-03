//
//  WeatherStruct.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-29.
//  Copyright © 2019 Project_E. All rights reserved.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
