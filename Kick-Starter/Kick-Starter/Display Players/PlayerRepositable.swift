//
//  PlayerRepositable.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/16.
//

import Foundation

typealias PlayerRepositoryResultBlock = (Result<PlayerResponseModel, Error>) -> Void

protocol PlayerRepositable {
    func fetchPlayerData(method: HTTPMethod, endpoint: String, completionHandler: @escaping PlayerRepositoryResultBlock)
}
