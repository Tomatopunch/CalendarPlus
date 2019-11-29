//
//  OpenWeatherAPIStruct.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-29.
//  Copyright © 2019 Project_E. All rights reserved.
//

import Foundation

// MARK: - OpenWeatherAPI
struct OpenWeatherAPI: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}
