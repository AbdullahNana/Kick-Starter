//
//  ViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import UIKit
import Foundation
import KickStarterFramework
import WatchConnectivity

final class TeamViewController: UIViewController {
    private lazy var teamViewModel = TeamViewModel(repository: TeamRepository(), delegate: self)
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchBar: UISearchBar!
    private let loader = LoaderViewController()
    private var watchSession: WCSession?
    
    private func setupWatchSession() {
        if WCSession.isSupported() {
            watchSession = WCSession.default
            watchSession?.delegate = self
            watchSession?.activate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        searchBarSetup()
        
        setupWatchSession()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // swiftlint:disable force_cast
        let destination = segue.destination as! TeamsInformationViewController
        guard let venue = teamViewModel.selectedVenue else { return }
        guard let team = teamViewModel.selectedTeam else { return }
        // swiftlint:enable force_cast
    
        destination.setVenue(venue: venue)
        destination.setTeam(team: team)
        
    }
    
    private func sendTeamMessage(team: Team) {
        let teamInfo: [String: [String]] = ["Team": ["\(team.name ?? "")", "\(team.founded ?? 0)", "\(team.logo ?? "")"]]
        watchSession?.sendMessage(teamInfo, replyHandler: nil, errorHandler: nil)
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
        teamViewModel.setSelectedTeam(index: indexPath.item)
        
        guard let team = teamViewModel.teamData(at: indexPath.item)?.team else { return }
        sendTeamMessage(team: team)
        performSegue(withIdentifier: "teamsInformationSegue", sender: indexPath)
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

extension TeamViewController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
    
    func sessionDidBecomeInactive(_ session: WCSession) {}
    
    func sessionDidDeactivate(_ session: WCSession) {}
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            if let searchString = message["Search"] as? String {
                self.updateSearchData(searchString: searchString)
            }
        }
    }
}
