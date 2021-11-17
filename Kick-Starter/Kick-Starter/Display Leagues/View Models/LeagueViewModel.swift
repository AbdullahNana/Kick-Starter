//
//  LeagueViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/19.
//

import Foundation
import KickStarterFramework

final class LeagueViewModel {
    private var leagueResponse: [LeagueModel]?
    private var leagueRepository: LeagueRepositable
    private(set) var selectedLeague: LeagueModel?
    private weak var delegate: ViewModelDelegate?
    
    init(repository: LeagueRepositable, delegate: ViewModelDelegate) {
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
