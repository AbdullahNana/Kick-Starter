//
//  StartViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/10.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func didTapSignUpButton(_ sender: Any) {
        performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    
    @IBAction private func didTapLogInButton(_ sender: Any) {
        performSegue(withIdentifier: "LogInSegue", sender: self)
    }
}
