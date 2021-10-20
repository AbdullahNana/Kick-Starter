//
//  ViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/20.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        show()
    }
    
    func show() {
        guard let url = URL(string: "https://www.livescore.com/en/" ) else {
            return
        }
    
        let config = SFSafariViewController.Configuration()
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        safariViewController.modalPresentationStyle = .overFullScreen
        present(safariViewController, animated: true)
    }

}
