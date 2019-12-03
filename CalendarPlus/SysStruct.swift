//
//  SysStruct.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-29.
//  Copyright © 2019 Project_E. All rights reserved.
//

import Foundation

// MARK: - Sys
struct Sys: Codable {
    
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}
