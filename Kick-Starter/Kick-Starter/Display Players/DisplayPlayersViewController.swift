//
//  DisplayPlayersViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/15.
//

import UIKit
import KickStarterFramework

class DisplayPlayersViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    private lazy var playerViewModel = DisplayPlayersViewModel(repository: PlayerRepository(), delegate: self)
    private let loader = LoaderViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        updatePlayerData(team: String(playerViewModel.selectedTeam?.id ?? 33))
        setTitle()
    }
    
    private func updatePlayerData(team: String) {
        playerViewModel.fetchPlayerData(endpoint: playerViewModel.endpoint(team: team))
    }
    
    private func setTitle() {
        self.title = "\(playerViewModel.selectedTeam?.name ?? "") Squad"
    }
    
    private func collectionViewSetup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearBackgroundColor
    }
    
    func setTeam(team: Team) {
        playerViewModel.setTeam(selectedTeam: team)
    }
}

extension DisplayPlayersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        playerViewModel.numberOfPlayerResults
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DisplayPlayersCollectionViewCell",
                                                            for: indexPath as IndexPath) as? DisplayPlayersCollectionViewCell
        else {return UICollectionViewCell()}
        
        let player = playerViewModel.playerData(at: indexPath.row)
        cell.configurePlayerCell(for: player)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension DisplayPlayersViewController: ViewModelDelegate {
    func refreshViewContents() {
        loader.start(container: self)
        self.collectionView.reloadData()
        loader.stop()
    }
    
    func showErrorMessage(error: Error) {
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "Okay")
    }
}
