//
//  ViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import UIKit
import Foundation

final class TeamViewController: UIViewController {
    private lazy var teamViewModel = TeamViewModel(repository: TeamRepository(), delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        updateTeamData()
    }

    private func updateTeamData() {
        teamViewModel.fetchTeamData()
    }
}

extension TeamViewController: TeamViewModelDelegate {
    func refreshViewContents() {
        print(self.teamViewModel.teamData)
    }
    
    func showErrorMessage(error: Error) {
        print(error.localizedDescription)
    }
}
