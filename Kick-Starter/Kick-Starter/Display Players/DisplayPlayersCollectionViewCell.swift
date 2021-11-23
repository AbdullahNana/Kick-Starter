//
//  DisplayPlayersCollectionViewCell.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/16.
//

import UIKit

class DisplayPlayersCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var playerNameLabel: UILabel!
    @IBOutlet private weak var playerPhotoImageView: UIImageView!
    @IBOutlet private weak var playerPositionLabel: UILabel!
    @IBOutlet private weak var playerAgeLabel: UILabel!
    
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
    
    func configurePlayerCell(for player: Player?) {
        let age = String(player?.age ?? 0)
        
        if age == "0" {
            playerAgeLabel.isHidden = true
        }
        
        playerNameLabel.text = player?.name
        playerPhotoImageView.loadImage(urlString: player?.photo ?? "")
        playerAgeLabel.text = "Age: " + age
        playerPositionLabel.text = "Position: \(player?.position ?? "Not specified")"
    }
}
