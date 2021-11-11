//
//  ViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import UIKit
import Foundation
import KickStarterFramework

final class TeamViewController: UIViewController {
    private lazy var teamViewModel = TeamViewModel(repository: TeamRepository(), delegate: self)
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchBar: UISearchBar!
    private let loader = LoaderViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        searchBarSetup()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        // swiftlint:disable force_cast
        let destination = segue.destination as! SingleVenueViewController
        // swiftlint:enable force_cast

        guard let selectedVenue = teamViewModel.selectedVenue else { return }
        destination.set(selectedVenue)
    }

    func set(league: League) {
        teamViewModel.set(league: league)
        updateTeamData(league: league.leagueID)
    }
    
    func updateTeamData(league: String) {
        teamViewModel.fetchTeamData(endpoint: teamViewModel.endpoint(league: league))
    }
    
    func updateSearchData(searchString: String) {
        teamViewModel.fetchTeamData(endpoint: teamViewModel.searchEndpoint(searchString: searchString))
    }
    
    private func collectionViewSetup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearBackgroundColor
    }
    
    private func searchBarSetup() {
        searchBar.searchTextField.textColor = .blackColor
        searchBar.delegate = self
    }
}

extension TeamViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         teamViewModel.numberOfTeamResults
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionViewCell",
                                                            for: indexPath as IndexPath) as? TeamCollectionViewCell
        else {return UICollectionViewCell()}
        
        let team = teamViewModel.teamData(at: indexPath.row)?.team
        cell.configureTeamCell(for: team)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        teamViewModel.setSelectedVenue(index: indexPath.item)
        performSegue(withIdentifier: "singleVenueViewSegue", sender: self )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension TeamViewController: TeamViewModelDelegate {
    func showSearchError() {
        showAlert(alertTitle: "Error", alertMessage: "Please search for a valid team.", actionTitle: "Okay")
    }
    
    func refreshViewContents() {
        loader.start(container: self)
        self.collectionView.reloadData()
        loader.stop()
    }
    
    func showErrorMessage(error: Error) {
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "Okay")
    }
}

extension TeamViewController: UISearchBarDelegate {    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let team = searchBar.text else { return }
        searchBar.text = ""
        searchBar.resignFirstResponder()
        loader.start(container: self)
        updateSearchData(searchString: team)
        loader.stop()
    }
}
