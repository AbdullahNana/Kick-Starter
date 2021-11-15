//
//  TeamsInformationViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/15.
//

import UIKit
import KickStarterFramework

class TeamsInformationViewController: UIViewController {
    private lazy var teamsInformationViewModel = TeamsInformationViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapVenueButton(_ sender: Any) {
        performSegue(withIdentifier: "displayVenueSegue", sender: self )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // swiftlint:disable force_cast
        let destination = segue.destination as! SingleVenueViewController
        // swiftlint:enable force_cast
        
        guard let selectedVenue = teamsInformationViewModel.selectedVenue else { return }
        destination.set(selectedVenue)
    }
    
    func set(venue: Venue) {
        teamsInformationViewModel.setSelectedVenue(venue: venue)
    }
}
