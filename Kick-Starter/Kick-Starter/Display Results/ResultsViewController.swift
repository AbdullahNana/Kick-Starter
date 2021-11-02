//
//  LiveScoreViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/21.
//

import UIKit
import SafariServices
import WebKit

class ResultsViewController: UIViewController, UIWebViewDelegate {
    private lazy var resultsViewModel = ResultsViewModel()
    @IBOutlet private weak var liveScoreWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didTapFixturesButton((Any).self)
    }

    @IBAction func didTapFixturesButton(_ sender: Any) {
        let request = resultsViewModel.resultsURL(result: "fixtures")
        liveScoreWebView.load(request)
    }
    
    @IBAction func didTapLiveScoresButton(_ sender: Any) {
        let request = resultsViewModel.resultsURL(result: "livescores")
        liveScoreWebView.load(request)
    }
}
