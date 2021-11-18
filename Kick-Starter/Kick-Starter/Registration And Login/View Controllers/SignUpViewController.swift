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
    private let loader = LoaderViewController()
    private lazy var signUpViewModel = SignUpViewModel(authenticationRepository: AuthenticationRepository(authentication: Auth.auth()),
                                                   delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
    }
    
    private func setupTextFields() {
        passwordTextField.isSecureTextEntry = true
    }
        
    @IBAction func didTapSignUpButton(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            loader.start(container: self)
            signUpViewModel.registerUser(email, password)
        }
    }
}

extension SignUpViewController: ViewModelDelegate {
    func refreshViewContents() {
        self.performSegue(withIdentifier: "SignUpToLogInSegue", sender: self)
        loader.stop()
    }
    
    func showErrorMessage(error: Error) {
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "Okay")
        loader.stop()
    }
}

extension SignUpViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
