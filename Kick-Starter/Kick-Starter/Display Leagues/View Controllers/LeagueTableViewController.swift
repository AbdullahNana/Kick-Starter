//
//  LeagueTableViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/19.
//

import UIKit
import KickStarterFramework

class LeagueTableViewController: UITableViewController {
    private lazy var leagueViewModel = LeagueViewModel(repository: LeagueRepository(), delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTableViewStyling()
        
        leagueViewModel.fetchLeagueData()
    }
    
    private func applyTableViewStyling() {
        tableView.backgroundColor = UIColor.clearBackgroundColor
        tableView.backgroundView = UIImageView(image: UIImage(named: "pitch"))
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.clearBackgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        // swiftlint:disable force_cast
        let destination = segue.destination as! TeamViewController
        // swiftlint:enable force_cast

        guard let selectedLeague = leagueViewModel.selectedLeague else { return }
        destination.set(league: selectedLeague.league)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leagueViewModel.numberOfLeagues
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueTableViewCell",
                                for: indexPath as IndexPath) as? LeagueTableViewCell
                                else {return UITableViewCell()}
        
        guard let league = leagueViewModel.leagueData(at: indexPath.row) else { return UITableViewCell() }
        
        cell.configure(for: league)
        return cell
    }
    
    func layoutSubviews() {
        tableView.frame = tableView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        leagueViewModel.setSelectedLeague(index: indexPath.row)
        performSegue(withIdentifier: "teamCollectionViewSegue", sender: self)
    }
}

extension LeagueTableViewController: ViewModelDelegate {
    func refreshViewContents() {
        self.tableView.reloadData()
    }
    
    func showErrorMessage(error: Error) {
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "Okay")
    }
}
