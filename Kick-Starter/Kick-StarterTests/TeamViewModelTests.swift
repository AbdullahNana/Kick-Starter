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
    private var mockedTeamViewModel: MockedTeamViewModel!

    override func setUp() {
        mockedTeamRepository = MockTeamRepository()
        mockedTeamViewModel = MockedTeamViewModel(repository: mockedTeamRepository)
    }
    func testNumberOfTeams() throws {
        mockedTeamViewModel.fetchTeamData()
        XCTAssert(!mockedTeamViewModel.teamData.isEmpty)
    }
}
