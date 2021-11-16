//
//  PlayerResponseModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/16.
//

import Foundation

struct PlayerResponseModel: Decodable {
    let get: String
    let response: [PlayerResponse]
}

struct PlayerResponse: Decodable {
    let team: Teams
    let players: [Player]
}

struct Player: Decodable {
    let id: Int
    let name: String
    let age: Int
    let number: Int?
    let position: String
    let photo: String
}

struct Teams: Decodable {
    let id: Int
    let name: String
    let logo: String
}
