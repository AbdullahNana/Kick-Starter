//
//  DisplayCoachesTableViewCell.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/16.
//

import UIKit
import KickStarterFramework

class DisplayCoachesTableViewCell: UITableViewCell {

    @IBOutlet weak var coachNameLabel: UILabel!
    @IBOutlet weak var coachPhotoImageView: UIImageView!
    @IBOutlet weak var coachNationalityLabel: UILabel!
    @IBOutlet weak var coachAgeLabel: UILabel!
    @IBOutlet weak var imageStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyCellStyling()
    }
    
    private func applyCellStyling() {
        backgroundColor = .clearBackgroundColor
        selectionStyle = .none
        
        imageStackView.applyStackViewStyling()
        coachPhotoImageView.applyImageStyling()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(coach: Coach?) {
        let name = "\(coach?.firstname ?? "Not specified") \(coach?.lastname ?? "")"
        
        let age = String(coach?.age ?? 0)
        
        coachAgeLabel.isHidden = age == "0"
        coachNameLabel.text = name
        coachPhotoImageView.loadImage(urlString: coach?.photo ?? "")
        coachNationalityLabel.text = "Nationality: \(coach?.nationality ?? "Not specified")"
        coachAgeLabel.text = "Age: " + age
    }
}
