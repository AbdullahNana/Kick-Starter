//
//  LeagueTableViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/19.
//

import UIKit


class LeagueTableViewController: UITableViewController {
    private lazy var leagueViewModel = LeagueViewModel()
    var leagues = [LeagueModel]()
    var arr = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        tableView.backgroundView = UIImageView(image: UIImage(named: "pitch"))
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        // swiftlint:disable force_cast
        let destination = segue.destination as! TeamViewController
        // swiftlint:enable force_cast

        guard let selectedLeague = leagueViewModel.selectedLeague else { return }
        destination.set(league: selectedLeague)
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
        
        let league = leagueViewModel.leagues[indexPath.row]
        
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
