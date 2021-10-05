//
//  TeamData.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import Foundation

struct Team: Codable {
    let id: Int?
    let name: String?
    let country: String?
    let founded: Int?
    let logo: String?
}

struct Venue: Codable {
    let id: Int?
    let name: String?
    let city: String?
    let capacity: Int?
    let image: String?
}

struct Response: Codable {
    let team: Team
    let venue: Venue
}

struct TeamData: Codable {
    let get: String
    let response: [Response]
}
