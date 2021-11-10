//
//  SignUpViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/10.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signUpButton: UIButton!
    private lazy var signUpViewModel = SignUpViewModel(authenticationRepository: AuthenticationRepository(authentication: Auth.auth()),
                                                   delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        applyButtonStyling()
        
    }
    
    private func applyButtonStyling() {
        signUpButton.titleLabel?.font = .labelFontStyle
        signUpButton.titleLabel?.textColor = .whiteColor
    }
    
    private func setupTextFields() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction private func didTapSinUpButton(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            signUpViewModel.registerUser(email, password)
        }
    }
}

extension SignUpViewController: ViewModelDelegate {
    func refreshViewContents() {
        self.performSegue(withIdentifier: "SignUpToLogInSegue", sender: self)
    }
    
    func showErrorMessage(error: Error) {
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "Okay")
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        
        if textField == passwordTextField {
            textField.resignFirstResponder()
        }
        return true
    }
}
