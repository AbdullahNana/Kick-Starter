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
    
    @IBAction private func didTapVenueButton(_ sender: Any) {
        performSegue(withIdentifier: "displayVenueSegue", sender: self )
    }
    
    @IBAction private func didTapPlayersButton(_ sender: Any) {
        performSegue(withIdentifier: "displayPlayersSegue", sender: self )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "displayVenueSegue" {
            // swiftlint:disable force_cast
            let destination = segue.destination as! SingleVenueViewController
            // swiftlint:enable force_cast
            
            guard let selectedVenue = teamsInformationViewModel.selectedVenue else { return }
            destination.set(selectedVenue)
        } else if segue.identifier == "displayPlayersSegue" {
            
            // swiftlint:disable force_cast
            let destination = segue.destination as! DisplayPlayersViewController
            // swiftlint:enable force_cast
            
            guard let selectedTeam = teamsInformationViewModel.selectedTeam else { return }
            destination.setTeam(team: selectedTeam)
        }
    }
    
    func setVenue(venue: Venue) {
        teamsInformationViewModel.setSelectedVenue(venue: venue)
    }
    
    func setTeam(team: Team) {
        teamsInformationViewModel.setSelectedTeam(team: team)
    }
}
