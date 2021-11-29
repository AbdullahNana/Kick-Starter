//
//  StartViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/10.
//

import UIKit
import WatchConnectivity

class StartViewController: UIViewController {

    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var logInButton: UIButton!
    
    @IBOutlet weak var button: UIButton!
    private var watchSession: WCSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        watchSession = WCSession.default
        watchSession?.delegate = self
        watchSession?.activate()
    }
    
    @IBAction private func didTapSignUpButton(_ sender: Any) {
        performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    @IBAction func tapButton(_ sender: Any) {
        sendMessage()
    }
    
    @IBAction private func didTapLogInButton(_ sender: Any) {
        performSegue(withIdentifier: "LogInSegue", sender: self)
    }
}

extension StartViewController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    private func sendMessage() {
        watchSession?.sendMessage(["iPhoneMessage": "Hello"], replyHandler: nil, errorHandler: nil)
    }
}
