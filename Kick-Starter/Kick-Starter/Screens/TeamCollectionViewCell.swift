//
//  TeamCollectionViewCell.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/07.
//

import UIKit
import KickStarterFramework

class TeamCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var teamYearFoundedLabel: UILabel!
    @IBOutlet private weak var teamLogoImageView: UIImageView!
    @IBOutlet private weak var teamNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyCellStyling()
    }
    
    private func applyCellStyling() {
        layer.borderColor = UIColor.whiteBorderColour
        layer.borderWidth = 5
        backgroundColor = UIColor.clearBackgroundColor
        layer.cornerRadius = 10
        backgroundColor = UIColor.clearBackgroundColor
    }
    
    func configureTeamCell(for team: Team?) {
        let founded = String(team?.founded ?? 0)
        
        teamYearFoundedLabel.isHidden = founded == "0"
        teamNameLabel.text = team?.name
        teamLogoImageView.loadImage(urlString: team?.logo ?? "")
        teamYearFoundedLabel.text = "Founded: " + founded
    }
}
