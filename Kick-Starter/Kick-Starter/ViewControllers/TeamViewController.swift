//
//  ViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import UIKit
import Foundation

final class TeamViewController: UIViewController {
    private lazy var viewModel = TeamViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateTeamData()
    }

    private func updateTeamData() {
        viewModel.loadTeamData { _ in
            print(self.viewModel.teamData)
        }
    }
}
