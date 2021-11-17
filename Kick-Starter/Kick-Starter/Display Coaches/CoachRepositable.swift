//
//  CoachRepositable.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/16.
//

import Foundation

typealias CoachRepositoryResultBlock = (Result<CoachResponseModel, Error>) -> Void

protocol CoachRepositable {
    func fetchCoachData(method: HTTPMethod, endpoint: String, completionHandler: @escaping CoachRepositoryResultBlock)
}
