//
//  TeamCollectionViewCell.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/07.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var teamYearFoundedLabel: UILabel!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    private lazy var teamViewModel = TeamViewModel(repository: TeamRepository(), delegate: self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension TeamCollectionViewCell: TeamViewModelDelegate {
    func refreshViewContents() {}
    
    func showErrorMessage(error: Error) {}
}
