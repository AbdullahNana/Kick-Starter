//
//  InterfaceController.swift
//  TeamInformationWatch WatchKit Extension
//
//  Created by Abdullah Nana on 2021/11/28.
//

import WatchKit
import Foundation
import WatchConnectivity
import UIKit

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var teamNameLabel: WKInterfaceLabel!
    @IBOutlet weak var teamYearFoundedLabel: WKInterfaceLabel!
    @IBOutlet weak var teamLogoImageView: WKInterfaceImage!
    private var watchSession: WCSession?
    
    private func setupWatchSession() {
        if WCSession.isSupported() {
            watchSession = WCSession.default
            watchSession?.delegate = self
            watchSession?.activate()
        }
    }
    
    override func awake(withContext context: Any?) {
        setupWatchSession()
    }
    
    override func willActivate() {}
    
    override func didDeactivate() {}

}

extension InterfaceController: WCSessionDelegate {
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        if let team = message["Team"] as? [String] {
            teamNameLabel.setText(team[0])
            teamYearFoundedLabel.setText(team[1])
            teamLogoImageView.loadImage(urlString: team[2])
        }
    }
}

extension WKInterfaceImage {
    func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        self.setImage(UIImage(named: "logo"))
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.setImage(image)
                    }
                }
            }
        }
    }
}
