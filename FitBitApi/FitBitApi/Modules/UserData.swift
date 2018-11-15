//
//  UserData.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation

struct Activity: Codable {
    let categories: [Category]
}

struct Category: Codable {
    let activities: [ActivityElement]
    let id: Int
    let name: String
    let subCategories: [Category]?
}

struct ActivityElement: Codable {
    let activityLevels: [ActivityLevel]?
    let hasSpeed: Bool
    let id: Int
    let name: String
    let mets: Double?
}

struct ActivityLevel: Codable {
    let id: Int
    let maxSpeedMPH, mets, minSpeedMPH: Double
    let name: String
}
