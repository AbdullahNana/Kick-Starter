//
//  LiveScoreViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/21.
//

import UIKit
import SafariServices

class LiveScoreViewController: UIViewController {
    private lazy var liveScoreViewModel = LiveScoreViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        displayLiveScore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        displayLiveScore()
    }
    
    func displayLiveScore() {
        guard let url = liveScoreViewModel.liveScoreURL() else { return }
        let config = SFSafariViewController.Configuration()
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        safariViewController.modalPresentationStyle = .overFullScreen
        present(safariViewController, animated: true)
    }
}
