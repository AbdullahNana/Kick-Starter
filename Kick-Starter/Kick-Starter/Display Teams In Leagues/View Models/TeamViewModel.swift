//
//  TeamViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import Foundation

final class TeamViewModel {
    private var teamResponse: SoccerTeamResponseModel?
    private var teamRepository: Repositable
    private weak var delegate: TeamViewModelDelegate?
    
    init(repository: Repositable, delegate: TeamViewModelDelegate) {
        self.teamRepository =  repository
        self.delegate = delegate
    }
    
    func fetchTeamData() {
        teamRepository.fetchTeamData(method: .GET, endpoint: .teamData) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let team):
                        self?.teamResponse = team
                        self?.delegate?.refreshViewContents()
                    case .failure(let error):
                        self?.delegate?.showErrorMessage(error: error)
                    }
                }
            }
    }
    
    var teamData: SoccerTeamResponseModel {
        teamResponse ?? SoccerTeamResponseModel(get: "", response: [])
    }
}
