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
        LeagueModel(id: 140, leagueName: "Spanish La Liga", logo: UIImage(named: "La Liga") ?? UIImage()),
        LeagueModel(id: 61, leagueName: "French League 1", logo: UIImage(named: "League 1") ?? UIImage()),
        LeagueModel(id: 135, leagueName: "Italian Serie A", logo: UIImage(named: "Serie A") ?? UIImage()),
        LeagueModel(id: 78, leagueName: "German Bundesliga", logo: UIImage(named: "Bundesliga") ?? UIImage()),
        LeagueModel(id: 61, leagueName: "English Premier League", logo: UIImage(named: "Premier League") ?? UIImage()),
        LeagueModel(id: 61, leagueName: "South African PSL", logo: UIImage(named: "PSL") ?? UIImage())
    ]
    
    var numberOfLeagues: Int {
        leagues.count
    }
    
    func setSelectedLeague(index: Int) {
        selectedLeague = leagues[safe: index]
    }
}
