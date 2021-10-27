//
//  LeagueViewModelTests.swift
//  Kick-StarterTests
//
//  Created by Abdullah Nana on 2021/10/27.
//

import XCTest
@testable import Kick_Starter

class LeagueViewModelTests: XCTestCase {

    private var mockedLeagueRepository: MockLeagueRepository!
    private var viewModelUnderTest: LeagueViewModel!
    private var mockedDelegate: MockDelegate!
    override func setUp() {
        mockedLeagueRepository = MockLeagueRepository()
        mockedDelegate = MockDelegate()
        viewModelUnderTest = LeagueViewModel(repository: MockLeagueRepository(), delegate: MockDelegate())
    }
    private var mockedTeamData: [LeagueModel] {
        let mockedLeagueData = League(leagueID: "39", leagueName: "English Premier League", imageURL: "Premier League")

        return [LeagueModel(league: mockedLeagueData)]
    }
    func testFetchLeagueDataSuccess() {
        mockedLeagueRepository.leagueApiResponse = .success(mockedTeamData)
        viewModelUnderTest.fetchLeagueData()
        XCTAssert(!(viewModelUnderTest.leagueResponse?.isEmpty ?? true))
        XCTAssert(mockedDelegate.refreshCalled)
    }
//    func testFetchTeamDataFailure() {
//        viewModelUnderTest.fetchTeamData(endpoint: viewModelUnderTest.endpoint())
//        XCTAssert(viewModelUnderTest.teamResponse?.response.isEmpty ?? true)
//        XCTAssert(mockedDelegate.showErrorCalled)
//    }
//    func testNumberOfTeamDataResultsArrayReturnsCorrectValueAfterSuccess() {
//        mockedTeamRepository.teamApiResponse = .success(mockedTeamData)
//        viewModelUnderTest.fetchTeamData(endpoint: viewModelUnderTest.endpoint())
//        XCTAssertEqual(1, viewModelUnderTest.numberOfTeamResults)
//    }
//    func testNumberOfTeamDataResultsArrayReturnsNilAfterFailure() {
//        viewModelUnderTest.fetchTeamData(endpoint: viewModelUnderTest.endpoint())
//        XCTAssertEqual(0, viewModelUnderTest.numberOfTeamResults)
//    }
//    func testNumberOfTeamDataResultsFunctionReturnsCorrectValueAfterSuccess() {
//        mockedTeamRepository.teamApiResponse = .success(mockedTeamData)
//        viewModelUnderTest.fetchTeamData(endpoint: viewModelUnderTest.endpoint())
//        XCTAssertEqual(viewModelUnderTest.teamData(at: 0)?.team.name, "Manchester United")
//    }
//    func testNumberOfTeamDataResultsFunctionReturnsNilAfterFailure() {
//        viewModelUnderTest.fetchTeamData(endpoint: viewModelUnderTest.endpoint())
//        XCTAssertEqual(viewModelUnderTest.teamData(at: 0)?.team.name, nil)
//    }
    final class MockDelegate: LeagueViewModelDelegate {
        var refreshCalled = false
        var showErrorCalled = false
        func refreshViewContents() {
            refreshCalled = true
        }
        func showErrorMessage(error: Error) {
            showErrorCalled = true
        }
    }
    final class MockLeagueRepository: LeagueRepositable {
        var leagueApiResponse: Result<[LeagueModel], Error> = .failure(URLError(.badServerResponse))
        func fetchLeagueData(completionHandler: @escaping LeagueRepositoryResultBlock) {
            completionHandler(leagueApiResponse)
        }
    }

}
