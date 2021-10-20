//
//  TeamTableViewCell.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/19.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var leagueLogoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyCellStyling()
    }
    
    private func applyCellStyling() {
        backgroundColor = UIColor.cellBackgroundColour
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(for league: LeagueModel) {
        leagueNameLabel.text = league.leagueName
        leagueLogoImageView.image =  UIImage(named: league.imageURL)
    }
}
