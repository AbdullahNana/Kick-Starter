//
//  Endpoints.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/05.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

enum ApiEndpoint: String {
    case teamData = "https://v3.football.api-sports.io/teams?league=39&season=2020"
    case leagueData = "https://v3.football.api-sports.io/leagues?id=39"
    }
