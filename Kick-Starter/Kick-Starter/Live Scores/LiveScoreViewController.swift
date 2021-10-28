//
//  LiveScoreViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/21.
//

import UIKit
import SafariServices
import WebKit

class LiveScoreViewController: UIViewController, UIWebViewDelegate {
    private lazy var liveScoreViewModel = LiveScoreViewModel()
    @IBOutlet private weak var liveScoreWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLiveScores()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        displayLiveScores()
    }

    func displayLiveScores() {
        let request = liveScoreViewModel.liveScoreURL()
        liveScoreWebView.load(request)
    }
}
