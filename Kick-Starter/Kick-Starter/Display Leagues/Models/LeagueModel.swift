//
//  LeagueModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/19.
//

import Foundation

struct LeagueModel: Codable {
    let league: League
}

struct League: Codable {
    let leagueID, leagueName, imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case leagueID = "leagueId"
        case leagueName, imageURL
    }
}
