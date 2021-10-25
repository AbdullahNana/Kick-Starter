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

@objcMembers class Venue: NSObject, Codable {
    let id: Int?
    let name: String?
    let city: String?
    var capacity: Int?
    let image: String?
    
    init(id: Int, name: String, city: String, capacity: Int, image: String) {
        self.id = id
        self.name = name
        self.city = city
        self.capacity = capacity
        self.image = image
    }
    
    var cap: NSNumber? {
        get {
            return capacity as NSNumber?
        }
        set(newNumber) {
            capacity = newNumber?.intValue
        }
    }
}

struct Response: Codable {
    let team: Team
    let venue: Venue
}

struct SoccerTeamResponseModel: Codable {    
    let get: String
    let response: [Response]
}
