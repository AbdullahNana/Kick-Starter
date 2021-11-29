//
//  InterfaceController.swift
//  TeamInformationWatch WatchKit Extension
//
//  Created by Abdullah Nana on 2021/11/28.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var label: WKInterfaceLabel!
    private var watchSession: WCSession?
    
    override func awake(withContext context: Any?) {
        if WCSession.isSupported() {
            watchSession = WCSession.default
            watchSession?.delegate = self
            watchSession?.activate()
        }
    }
    override func willActivate() {}
    override func didDeactivate() {}

}

extension InterfaceController: WCSessionDelegate {
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        if let message = message["iPhoneMessage"] as? String {
            label.setText(message)
        }
    }
}
