//
//  DisplayPlayersViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/15.
//

import Foundation
import KickStarterFramework

final class DisplayPlayersViewModel {
    private var playerResponse: PlayerResponseModel?
    private(set) var selectedTeam: Team?
    private var playerRepository: PlayerRepositable
    private weak var delegate: ViewModelDelegate?
    
    init(repository: PlayerRepositable, delegate: ViewModelDelegate) {
        self.playerRepository =  repository
        self.delegate = delegate
    }
    
    func endpoint(team: String) -> String {
        "https://v3.football.api-sports.io/players/squads?team=\(team)"
    }
    
    func fetchPlayerData(endpoint: String) {
        playerRepository.fetchPlayerData(method: .GET, endpoint: endpoint) { [weak self] result in
            switch result {
            case .success(let player):
                self?.playerResponse = player
                self?.delegate?.refreshViewContents()
            case .failure(let error):
                self?.delegate?.showErrorMessage(error: error)
            }
        }
    }
    
    func playerData(at index: Int) -> Player? {
        playerResponse?.response.first?.players[safe: index]
    }
    
    func setTeam(selectedTeam: Team) {
        self.selectedTeam = selectedTeam
    }
    
    var numberOfPlayerResults: Int {
        playerResponse?.response.first?.players.count ?? 0
    }
}
