//
//  DisplayCoachesViewController.swift
//  
//
//  Created by Abdullah Nana on 2021/11/16.
//

import UIKit
import KickStarterFramework

class DisplayCoachesViewController: UIViewController {
    private let loader = LoaderViewController()
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    private lazy var coachViewModel = DisplayCoachesViewModel(repository: CoachRepository(), delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        applyTableViewStyling()
        updateCoachData(team: String(coachViewModel.selectedTeam?.id ?? 33))
        setTitle()
        searchBarSetup()
    }
    
    func setTeam(team: Team) {
        coachViewModel.setTeam(selectedTeam: team)
    }
    
    private func setTitle() {
        self.title = "\(coachViewModel.selectedTeam?.name ?? "") Coaches"
    }
    
    private func updateCoachData(team: String) {
        coachViewModel.fetchCoachData(endpoint: coachViewModel.endpoint(team: team))
    }
    
    private func updateCoachSearchData(coach: String) {
        coachViewModel.fetchCoachData(endpoint: coachViewModel.searchEndpoint(coach: coach))
    }
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func applyTableViewStyling() {
        tableView.backgroundColor = .clearBackgroundColor
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .clearBackgroundColor
    }
    
    private func searchBarSetup() {
        searchBar.searchTextField.textColor = .blackColor
        searchBar.delegate = self
    }
}

extension DisplayCoachesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coachViewModel.numberOfCoachResults
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayCoachesTableViewCell",
                                                       for: indexPath as IndexPath) as? DisplayCoachesTableViewCell
        else {return UITableViewCell()}
        
        guard let coach = coachViewModel.coachData(at: indexPath.row) else { return UITableViewCell() }
        cell.configure(coach: coach)
        return cell
    }
    
    func layoutSubviews() {
        tableView.frame = tableView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
}

extension DisplayCoachesViewController: TeamViewModelDelegate {
    func showSearchError() {
        showAlert(alertTitle: "Error", alertMessage: "Please search for another coach.", actionTitle: "Okay")
    }
    
    func refreshViewContents() {
        loader.start(container: self)
        self.tableView.reloadData()
        loader.stop()
    }
    
    func showErrorMessage(error: Error) {
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "Okay")
    }
}

extension DisplayCoachesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let coach = searchBar.text else { return }
        searchBar.text = ""
        searchBar.resignFirstResponder()
        loader.start(container: self)
        updateCoachSearchData(coach: coach)
        loader.stop()
    }
}
