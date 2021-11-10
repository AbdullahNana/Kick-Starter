//
//  AuthenticationRepositable.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/10.
//

import Foundation

typealias AuthenticationRepositoryResultBlock = (Result<Bool, Error>) -> Void

protocol AuthenticationRepositable {
    func registerUser(_ email: String, _ password: String, completion: @escaping AuthenticationRepositoryResultBlock)
    func signInUser(_ email: String, _ password: String, completion: @escaping AuthenticationRepositoryResultBlock)
}
