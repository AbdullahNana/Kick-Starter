//
//  AuthenticationRepositroy.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/10.
//

import Foundation
import FirebaseAuth

struct AuthenticationRepository: AuthenticationRepositable {
    
    private var authentication: Auth
    
    init(authentication: Auth) {
        self.authentication = authentication
    }
    
    func registerUser(_ email: String, _ password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        authentication.createUser(withEmail: email, password: password) { _, error in
            if let err = error {
                completion(.failure(err))
            } else {
                completion(.success(true))
            }
        }
    }
    
    func signInUser(_ email: String, _ password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        authentication.signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }
}
