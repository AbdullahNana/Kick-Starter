//
//  DisplayCoachesTableViewCell.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/16.
//

import UIKit

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
        backgroundColor = UIColor.clearBackgroundColor
        selectionStyle = .none
        
        coachPhotoImageView.layer.cornerRadius = 20
        coachPhotoImageView.clipsToBounds = true
        
        imageStackView.backgroundColor = .clear
        imageStackView.layer.shadowColor = UIColor.black.cgColor
        imageStackView.layer.shadowOffset = CGSize(width: 5, height: 5)
        imageStackView.layer.shadowOpacity = 0.98
        imageStackView.layer.shadowRadius = 9.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(coach: Coach?) {
        coachNameLabel.text = coach?.name
        coachPhotoImageView.loadImage(urlString: coach?.photo ?? "")
        coachNationalityLabel.text = "Nationality: \(coach?.nationality ?? "")"
        coachAgeLabel.text = "Age: " + String(coach?.age ?? 0)
    }
}
