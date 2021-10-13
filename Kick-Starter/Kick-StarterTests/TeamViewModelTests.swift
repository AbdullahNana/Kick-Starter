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
    let mockedTeamData = Response(team: Team(id: 33, name: "Manchester United", country: "England",
                                             founded: 1878,
                                             logo: "https://media.api-sports.io/football/teams/33.png"),
                                  venue: Venue(id: 557, name: "Old Trafford", city: "Manchester",
                                               capacity: 76212,
                                               image: "https://media.api-sports.io/football/venues/556.png"))

    override func setUp() {
        mockedTeamRepository = MockTeamRepository()
        mockedDelegate = MockDelegate()
        viewModelUnderTest = TeamViewModel(repository: mockedTeamRepository, delegate: mockedDelegate)
    }
    func testTeamDataArrayUpdatesAfterSuccesfulApiCall() {
        mockedTeamRepository.apiCallResult = .success(SoccerTeamResponseModel(get: "teams", response: [mockedTeamData]))
        viewModelUnderTest.fetchTeamData()
        XCTAssert(!viewModelUnderTest.teamData.isEmpty)
    }
    func testTeamDataArrayDoesNotUpdatesAfterFailedApiCall() {
        mockedTeamRepository.apiCallResult = .failure(URLError(.badServerResponse))
        viewModelUnderTest.fetchTeamData()
        XCTAssert(viewModelUnderTest.teamData.isEmpty)
    }
    func testNumberOfTeamDataResults() {
        mockedTeamRepository.apiCallResult = .success(SoccerTeamResponseModel(get: "teams", response: [mockedTeamData]))
        viewModelUnderTest.fetchTeamData()
        XCTAssertEqual(1, viewModelUnderTest.numberOfTeamResults)
    }
    final class MockDelegate: TeamViewModelDelegate {
        func refreshViewContents() {
        }
        func showErrorMessage(error: Error) {
        }
    }
    final class MockTeamRepository: Repositable {
        var apiCallResult: Result<SoccerTeamResponseModel, Error> = .failure(URLError(.badServerResponse))
        func fetchTeamData(method: HTTPMethod, endpoint: ApiEndpoint,
                           completionHandler: @escaping TeamRepositoryResultBlock) {
            completionHandler(apiCallResult)
        }
    }
}
