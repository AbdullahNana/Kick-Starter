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
        viewModelUnderTest = LeagueViewModel(repository: mockedLeagueRepository, delegate: mockedDelegate)
    }
    private var mockedLeagueData: [LeagueModel] {
        let mockedLeagueData = League(leagueID: "39", leagueName: "English Premier League", imageURL: "Premier League")

        return [LeagueModel(league: mockedLeagueData)]
    }
    func testFetchLeagueDataSuccess() throws {
        mockedLeagueRepository.leagueApiResponse = .success(mockedLeagueData)
        viewModelUnderTest.fetchLeagueData()
        XCTAssert(!(viewModelUnderTest.leagueResponse?.isEmpty ?? true))
        XCTAssert(mockedDelegate.refreshCalled)
    }
    func testFetchTeamDataFailure() {
        viewModelUnderTest.fetchLeagueData()
        XCTAssert(viewModelUnderTest.leagueResponse?.isEmpty ?? true)
        XCTAssert(mockedDelegate.showErrorCalled)
    }
    func testNumberOfLeagueDataResultsArrayReturnsCorrectValueAfterSuccess() {
        mockedLeagueRepository.leagueApiResponse = .success(mockedLeagueData)
        viewModelUnderTest.fetchLeagueData()
        XCTAssertEqual(1, viewModelUnderTest.numberOfLeagues)
    }
    func testNumberOfLeagueDataResultsArrayReturnsNilAfterFailure() {
        viewModelUnderTest.fetchLeagueData()
        XCTAssertEqual(0, viewModelUnderTest.numberOfLeagues)
    }
    func testNumberOfTeamDataResultsFunctionReturnsCorrectValueAfterSuccess() {
        mockedLeagueRepository.leagueApiResponse = .success(mockedLeagueData)
        viewModelUnderTest.fetchLeagueData()
        XCTAssertEqual(viewModelUnderTest.leagueData(at: 0)?.league.leagueName, "English Premier League")
    }
    func testNumberOfTeamDataResultsFunctionReturnsNilAfterFailure() {
        viewModelUnderTest.fetchLeagueData()
        XCTAssertEqual(viewModelUnderTest.leagueData(at: 0)?.league.leagueName, nil)
    }
    func testSelectedLeagueSetCorrectlyAfterSuccess() {
        mockedLeagueRepository.leagueApiResponse = .success(mockedLeagueData)
        viewModelUnderTest.fetchLeagueData()
        viewModelUnderTest.setSelectedLeague(index: 0)
        XCTAssertEqual(viewModelUnderTest.leagueData(at: 0)?.league.leagueName, "English Premier League")
    }
    func testSelectedLeagueSetsLeagueArrayToNilAfterFailure() {
        viewModelUnderTest.fetchLeagueData()
        viewModelUnderTest.setSelectedLeague(index: 0)
        XCTAssertEqual(viewModelUnderTest.leagueData(at: 0)?.league.leagueName, nil)
    }
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
