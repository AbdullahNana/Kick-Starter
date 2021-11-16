//
//  TeamsInformationViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/15.
//

import Foundation
import KickStarterFramework

final class TeamsInformationViewModel {
    private(set) var selectedVenue: Venue?
    private(set) var selectedTeam: Team?
    func setSelectedVenue(venue: Venue) {
        selectedVenue = venue
    }
    func setSelectedTeam(team: Team) {
        selectedTeam = team
    }
}
