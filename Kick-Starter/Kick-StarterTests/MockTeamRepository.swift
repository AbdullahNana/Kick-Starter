//
//  MockTeamRepository.swift
//  Kick-StarterTests
//
//  Created by Abdullah Nana on 2021/10/11.
//

import Foundation
@testable import Kick_Starter

final class MockTeamRepository: Repositable {
    let mockedTeamData = Response(team: Team(id: 33, name: "Manchester United", country: "England",
                                             founded: 1878,
                                             logo: "https://media.api-sports.io/football/teams/33.png"),
                                  venue: Venue(id: 557, name: "Old Trafford", city: "Manchester",
                                               capacity: 76212,
                                               image: "https://media.api-sports.io/football/venues/556.png"))
    func fetchTeamData(method: HTTPMethod, endpoint: ApiEndpoint,
                       completionHandler: @escaping TeamRepositoryResultBlock) {
        completionHandler(.success(SoccerTeamResponseModel(get: "teams", response: [mockedTeamData])))
    }
}

extension MockTeamRepository: TeamViewModelDelegate {
    func refreshViewContents() {}
    func showErrorMessage(error: Error) {}
}
