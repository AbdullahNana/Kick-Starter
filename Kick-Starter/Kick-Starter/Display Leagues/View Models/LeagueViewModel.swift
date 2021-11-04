//
//  LeagueViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/19.
//

import Foundation
import DisplayTeamsFramework

final class LeagueViewModel {
    private(set) var leagueResponse: [LeagueModel]?
    private var leagueRepository: LeagueRepositable
    private(set) var selectedLeague: LeagueModel?
    private weak var delegate: LeagueViewModelDelegate?
    
    init(repository: LeagueRepositable, delegate: LeagueViewModelDelegate) {
        self.leagueRepository =  repository
        self.delegate = delegate
    }
    
    var numberOfLeagues: Int {
        leagueResponse?.count ?? 0
    }
    
    func setSelectedLeague(index: Int) {
        selectedLeague = leagueResponse?[safe: index]
    }
    
    func leagueData(at index: Int) -> LeagueModel? {
        leagueResponse?[safe: index]
    }
    
    func fetchLeagueData() {
        leagueRepository.fetchLeagueData { [weak self] result in
            switch result {
            case .success(let league):
                self?.leagueResponse = league
                self?.delegate?.refreshViewContents()
            case .failure(let error):
                self?.delegate?.showErrorMessage(error: error)
            }
        }
    }
}
