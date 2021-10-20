//
//  LeagueTableViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/19.
//

import UIKit

class LeagueTableViewController: UITableViewController {
    private lazy var leagueViewModel = LeagueViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        // swiftlint:disable force_cast
        let destination = segue.destination as! TeamViewController
        // swiftlint:enable force_cast

        guard let selectedLeague = leagueViewModel.selectedLeague else { return }
        destination.set(league: selectedLeague)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leagueViewModel.numberOfLeagues
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueTableViewCell",
                                for: indexPath as IndexPath) as? LeagueTableViewCell
                                else {return UITableViewCell()}
        
        let league = leagueViewModel.leagues[indexPath.row]
        
        cell.configure(for: league)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        leagueViewModel.setSelectedLeague(index: indexPath.row)
        performSegue(withIdentifier: "teamCollectionViewSegue", sender: self)
    }
}
