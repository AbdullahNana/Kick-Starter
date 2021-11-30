//
//  LoginViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/10.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var logInButton: UIButton!
    private let loader = LoaderViewController()
    private lazy var logInViewModel = LogInViewModel(authenticationRepository: AuthenticationRepository(authentication: Auth.auth()),
                                                       delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        self.performSegue(withIdentifier: "LogInToKickStarterSegue", sender: self)
    }
    
    private func setupTextFields() {
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction private func didTapLogInButton(_ sender: Any) {
        if let email = self.emailTextField.text,
           let password = self.passwordTextField.text {
            loader.start(container: self)
            logInViewModel.authenticateUser(email, password)
        }
    }
}

extension LoginViewController: ViewModelDelegate {
    func refreshViewContents() {
        self.performSegue(withIdentifier: "LogInToKickStarterSegue", sender: self)
        loader.stop()
    }
    
    func showErrorMessage(error: Error) {
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "Okay")
        loader.stop()
    }
}

extension LoginViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
