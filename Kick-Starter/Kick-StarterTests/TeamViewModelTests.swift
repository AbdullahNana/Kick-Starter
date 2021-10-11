//
//  TeamViewModelTests.swift
//  Kick-StarterTests
//
//  Created by Abdullah Nana on 2021/10/11.
//

import XCTest
@testable import Kick_Starter

class TeamViewModelTests: XCTestCase {
    private var teamViewModel: TeamViewModel!
    private var mockedTeamRepository: MockTeamRepository!

    override func setUp() {
        mockedTeamRepository = MockTeamRepository()
        teamViewModel = .init(repository: mockedTeamRepository, delegate: mockedTeamRepository)
    }
    func testTeamDataUpdated() {
        teamViewModel.fetchTeamData()
        XCTAssert(!teamViewModel.teamData.isEmpty)
    }
    func testNumberOfTeams() throws {
        let numberOfTeams = teamViewModel.numberOfTeamResults
        XCTAssertEqual(numberOfTeams, 20, "Number of teams are not equal")
    }
}
