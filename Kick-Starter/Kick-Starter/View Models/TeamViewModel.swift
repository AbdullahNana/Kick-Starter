//
//  TeamViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import Foundation

final class TeamViewModel {
    private lazy var teamResults = TeamData(get: "", response: [])
    private lazy var teamRepository = TeamRepository()
    
    func loadTeamData(completion: @escaping (TeamData) -> Void) {
        teamRepository.teamData(method: .GET, endpoint: .teamData) { result in
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
    
    var teamData: TeamData {
        teamResults
    }
}
