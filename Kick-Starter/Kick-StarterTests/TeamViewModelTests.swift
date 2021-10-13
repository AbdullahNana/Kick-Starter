//
//  TeamViewModelTests.swift
//  Kick-StarterTests
//
//  Created by Abdullah Nana on 2021/10/11.
//

import XCTest
@testable import Kick_Starter

class TeamViewModelTests: XCTestCase {
    private var mockedTeamRepository: MockTeamRepository!
    private var viewModelUnderTest: TeamViewModel!
    private var mockedDelegate: TeamViewModelDelegate!

    override func setUp() {
        mockedTeamRepository = MockTeamRepository()
        mockedDelegate = MockDelegate()
        viewModelUnderTest = TeamViewModel(repository: mockedTeamRepository, delegate: mockedDelegate)
    }
    func testNumberOfTeams() {
        viewModelUnderTest.fetchTeamData()
        XCTAssertEqual(viewModelUnderTest.teamData(at: 0)?.team.name, "Manchester United")
    }
    class MockDelegate: TeamViewModelDelegate {
        func refreshViewContents() {
        }
        func showErrorMessage(error: Error) {
        }
    }
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
}
