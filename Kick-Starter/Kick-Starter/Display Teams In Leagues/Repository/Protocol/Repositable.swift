//
//  Repositable.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/06.
//

import Foundation

typealias TeamRepositoryResultBlock = (Result<SoccerTeamResponseModel, Error>) -> Void

protocol Repositable {
    func fetchTeamData(method: HTTPMethod, endpoint: ApiEndpoint, completionHandler: @escaping TeamRepositoryResultBlock)
}
