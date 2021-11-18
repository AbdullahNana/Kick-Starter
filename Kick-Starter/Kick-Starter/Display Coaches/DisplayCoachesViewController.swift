//
//  DisplayCoachesViewController.swift
//  
//
//  Created by Abdullah Nana on 2021/11/16.
//

import UIKit

class DisplayCoachesViewController: UIViewController {
    private let loader = LoaderViewController()
    @IBOutlet weak var tableView: UITableView!
    private lazy var coachViewModel = DisplayCoachesViewModel(repository: CoachRepository(), delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        applyTableViewStyling()
        updateCoachData(team: String(coachViewModel.selectedTeam?.id ?? 33))
        setTitle()
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
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func applyTableViewStyling() {
        tableView.backgroundColor = .clearBackgroundColor
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .clearBackgroundColor
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

extension DisplayCoachesViewController: ViewModelDelegate {
    func refreshViewContents() {
        loader.start(container: self)
        self.tableView.reloadData()
        loader.stop()
    }
    
    func showErrorMessage(error: Error) {
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "Okay")
    }
}
