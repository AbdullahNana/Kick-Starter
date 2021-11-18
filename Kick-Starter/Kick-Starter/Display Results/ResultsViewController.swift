//
//  LiveScoreViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/21.
//

import UIKit
import SafariServices
import WebKit
import KickStarterFramework

class ResultsViewController: UIViewController, UIWebViewDelegate {
    private lazy var resultsViewModel = ResultsViewModel()
    @IBOutlet private weak var liveScoreWebView: WKWebView!
    @IBOutlet private weak var fixturesButton: UIButton!
    @IBOutlet private weak var liveScoresButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didTapFixturesButton((Any).self)
        applyButtonStyling()
    }
    
    private func applyButtonStyling() {
        fixturesButton.titleLabel?.font = .labelFontStyle
        liveScoresButton.titleLabel?.font = .labelFontStyle
        fixturesButton.titleLabel?.textColor = .whiteColor
        liveScoresButton.titleLabel?.textColor = .whiteColor
        fixturesButton.tintColor = .blackColor
        liveScoresButton.tintColor = .blackColor
    }

   private func loadWidget(type: String) {
        if let result = resultsViewModel.resultsURL(result: type) {
            let request = URLRequest(url: result)
            liveScoreWebView.load(request)
        }
    }
    
    @IBAction func didTapFixturesButton(_ sender: Any) {
        loadWidget(type: "fixtures")
    }
    
    @IBAction func didTapLiveScoresButton(_ sender: Any) {
        loadWidget(type: "livescores")
    }
}
