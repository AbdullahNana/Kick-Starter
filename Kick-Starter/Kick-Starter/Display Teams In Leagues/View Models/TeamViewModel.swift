//
//  TeamViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import Foundation

final class TeamViewModel {
    private(set) var teamResponse: SoccerTeamResponseModel?
    private var teamRepository: Repositable
    private weak var delegate: TeamViewModelDelegate?
    
    init(repository: Repositable, delegate: TeamViewModelDelegate) {
        self.teamRepository =  repository
        self.delegate = delegate
    }
    
    func fetchTeamData() {
        teamRepository.fetchTeamData(method: .GET, endpoint: .teamData) { [weak self] result in
            switch result {
            case .success(let team):
                self?.teamResponse = team
                self?.delegate?.refreshViewContents()
            case .failure(let error):
                self?.delegate?.showErrorMessage(error: error)
            }
        }
    }
    
    func teamData(at index: Int) -> Response? {
        teamResponse?.response[safe: index]
    }
    
    var numberOfTeamResults: Int {
        teamResponse?.response.count ?? 0
    }
}
