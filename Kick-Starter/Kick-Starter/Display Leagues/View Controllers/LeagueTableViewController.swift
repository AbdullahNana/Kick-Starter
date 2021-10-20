//
//  LeagueTableViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/19.
//

import UIKit
import Firebase
import FirebaseDatabase

class LeagueTableViewController: UITableViewController {
    private lazy var leagueViewModel = LeagueViewModel()
    var leagues = [LeagueModel]()
    var arr = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        //self.tableView.backgroundView = UIImageView(image: UIImage(named: "La Liga")!)
        
        let ref = Database.database().reference()
        
        ref.child("Leagues").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? NSArray else {return}
            print(value)
            for league in value {
                self.arr.append(league)
            }
            //print(self.arr)
        })
        
//        ref.child("leagues").observe(.value, with: { snapshot in
//            print(snapshot.value)
//            guard let data = try? JSONSerialization.data(withJSONObject: snapshot.value as Any, options: []) else { return }
//            let yourStructObject = try? JSONDecoder().decode(LeagueModel.self, from: data)
//            print(yourStructObject)
//        })

        
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
