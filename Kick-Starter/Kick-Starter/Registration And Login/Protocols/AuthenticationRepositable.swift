//
//  AuthenticationRepositable.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/10.
//

import Foundation

protocol AuthenticationRepositable {
    func registerUser(_ email: String, _ password: String, completion: @escaping (Result<Bool, Error>) -> Void)
    func signInUser(_ email: String, _ password: String, completion: @escaping (Result<Bool, Error>) -> Void)
}
