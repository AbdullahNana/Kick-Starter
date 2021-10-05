//
//  ViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import UIKit
import Foundation

final class TeamViewController: UIViewController {
    private lazy var teamViewModel = TeamViewModel(repository: TeamRepository())

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTeamData()
    }

    private func updateTeamData() {
        teamViewModel.loadTeamData { _ in
            print(self.teamViewModel.teamData)
            self.imageView.loadImage(urlString: self.teamViewModel.teamData.response.first?.team.logo ?? "")
        }
    }
}
