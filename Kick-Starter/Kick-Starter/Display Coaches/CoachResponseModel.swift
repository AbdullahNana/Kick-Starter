//
//  CoachResponseModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/16.
//

import Foundation

struct CoachResponseModel: Decodable {
    let get: String
    let response: [Coach]
}

struct Coach: Decodable {
    let id: Int?
    let name: String?
    let age: Int?
    let nationality: String?
    let photo: String?
}
