//
//  TeamViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import Foundation

final class TeamViewModel {
    private var teamResults: SoccerTeamResponseModel?
    private var teamRepository: TeamRepository
    
    init(repository: TeamRepository) {
        self.teamRepository =  repository
    }
    
    func loadTeamData(completion: @escaping (SoccerTeamResponseModel) -> Void) {
        teamRepository.fetchTeamData(method: .GET, endpoint: .teamData) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let team):
                        self.teamResults = team
                        completion(team)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
    }
    
    var teamData: SoccerTeamResponseModel {
        teamResults ?? SoccerTeamResponseModel(get: "", response: [])
    }
}
