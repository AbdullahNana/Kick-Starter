//
//  ViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    private lazy var viewModel = TeamViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateTeamData()
    }

    private func updateTeamData() {
        viewModel.loadTeamData { data in
            print(data)
        }
    }
}

