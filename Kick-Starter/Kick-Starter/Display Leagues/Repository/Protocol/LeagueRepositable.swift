//
//  LeagueRepositable.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/21.
//

import Foundation

typealias LeagueRepositoryResultBlock = (Result<[LeagueModel], Error>) -> Void

protocol LeagueRepositable {
    func fetchLeagueData(completionHandler: @escaping LeagueRepositoryResultBlock)
}
