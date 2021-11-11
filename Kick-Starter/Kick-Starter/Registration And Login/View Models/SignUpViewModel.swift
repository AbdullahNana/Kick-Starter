//
//  SignUpViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/10.
//

import Foundation

class SignUpViewModel {
    
    private weak var delegate: ViewModelDelegate?
    private var authenticationRepository: AuthenticationRepositable
    
    init(authenticationRepository: AuthenticationRepositable, delegate: ViewModelDelegate) {
        self.authenticationRepository = authenticationRepository
        self.delegate = delegate
    }
    
    func registerUser(_ email: String, _ password: String) {
        authenticationRepository.registerUser(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.delegate?.refreshViewContents()
            case .failure(let error):
                self?.delegate?.showErrorMessage(error: error)
            }
        }
    }
}
