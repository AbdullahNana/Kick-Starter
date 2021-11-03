//
//  SingleFixtureViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/02.
//

import UIKit
import WebKit

class SingleFixtureViewController: UIViewController {
    private lazy var singleFixtureViewModel = SingleFixtureViewModel()
    @IBOutlet private weak var singleFixtureWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        displaySingleFixture()
    }
    
    private func displaySingleFixture() {
        if let result = singleFixtureViewModel.fixtureURL() {
            let request = URLRequest(url: result)
            singleFixtureWebView.load(request)
        }
    }
}
