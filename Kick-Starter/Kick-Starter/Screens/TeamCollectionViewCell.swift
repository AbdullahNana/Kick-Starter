//
//  TeamCollectionViewCell.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/07.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var teamYearFoundedLabel: UILabel!
    @IBOutlet private weak var teamLogoImageView: UIImageView!
    @IBOutlet private weak var teamNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureTeamCell(for team: Team? = nil) {
        teamNameLabel.text = team?.name
        teamLogoImageView.loadImage(urlString: team?.logo ?? "")
        teamYearFoundedLabel.text = String(team?.founded ?? 0)
    }
}
