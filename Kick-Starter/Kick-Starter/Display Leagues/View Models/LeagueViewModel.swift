//
//  LeagueViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/19.
//

import Foundation

final class LeagueViewModel {
    private(set) var selectedLeague: LeagueModel?
    
    private(set) var leagues: [LeagueModel] = [
        LeagueModel(imageURL: "La Liga", leagueId: 140, leagueName: "Spanish La Liga"),
        LeagueModel(imageURL: "League 1", leagueId: 61, leagueName: "French League 1"),
        LeagueModel(imageURL: "Serie A", leagueId: 135, leagueName: "Italian Serie A"),
        LeagueModel(imageURL: "Bundesliga", leagueId: 78, leagueName: "German Bundesliga"),
        LeagueModel(imageURL: "Premier League", leagueId: 39, leagueName: "English Premier League"),
        LeagueModel(imageURL: "PSL", leagueId: 288, leagueName: "South African PSL")
    ]
    
    var numberOfLeagues: Int {
        leagues.count
    }
    
    func setSelectedLeague(index: Int) {
        selectedLeague = leagues[safe: index]
    }
}
