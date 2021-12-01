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

    @IBOutlet private weak var teamNameLabel: WKInterfaceLabel!
    @IBOutlet private weak var teamYearFoundedLabel: WKInterfaceLabel!
    @IBOutlet private weak var teamLogoImageView: WKInterfaceImage!
    @IBOutlet private weak var interfaceGroup: WKInterfaceGroup!
    @IBOutlet weak var teamSearchButton: WKInterfaceButton!
    private var watchSession: WCSession?
    private var searchString = ""
    
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

    @IBAction func didTapTeamSearchButton() {
        sendSearchMessage()
    }
    
    private func sendSearchMessage() {
        let teamInfo: [String: String] = ["Search": searchString]
        watchSession?.sendMessage(teamInfo, replyHandler: nil, errorHandler: nil)
    }
}

extension InterfaceController: WCSessionDelegate {
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        if let team = message["Team"] as? [String] {
            searchString = team[0].components(separatedBy: " ").first ?? team[0]
            teamSearchButton.setTitle("Search \(searchString)")
            teamNameLabel.setText(team[0])
            teamYearFoundedLabel.setText("Founded: \(team[1])")
            teamLogoImageView.loadImage(urlString: team[2])
        }
    }
}
