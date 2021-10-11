//
//  MockedTeamViewModel.swift
//  Kick-StarterTests
//
//  Created by Abdullah Nana on 2021/10/11.
//

import Foundation
@testable import Kick_Starter

class MockedTeamViewModel {
    private var teamResponse: SoccerTeamResponseModel?
    private var teamRepository: Repositable
    init(repository: Repositable) {
        self.teamRepository =  repository
    }
    func fetchTeamData() {
        teamRepository.fetchTeamData(method: .GET, endpoint: .teamData) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let team):
                    self?.teamResponse = team
                case .failure(_):
                    return
                }
            }
        }
    }
    var teamData: [Response] {
        teamResponse?.response ?? []
    }
    var numberOfTeamResults: Int {
        teamResponse?.response.count ?? 0
    }
}
