//
//  DisplayCoachesViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/16.
//

import Foundation
import KickStarterFramework

final class DisplayCoachesViewModel {
    private(set) var coachResponse: CoachResponseModel?
    private(set) var selectedTeam: Team?
    private var caochRepository: CoachRepositable
    private weak var delegate: TeamViewModelDelegate?
    
    init(repository: CoachRepositable, delegate: TeamViewModelDelegate) {
        self.caochRepository =  repository
        self.delegate = delegate
    }
    
    func endpoint(team: String) -> String {
        "https://v3.football.api-sports.io/coachs?team=\(team)"
    }
    
    func searchEndpoint(coach: String) -> String {
        "https://v3.football.api-sports.io/coachs?search=\(coach)"
    }
    
    func fetchCoachData(endpoint: String) {
        caochRepository.fetchCoachData(method: .GET, endpoint: endpoint) { [weak self] result in
            switch result {
            case .success(let coach):
                self?.coachResponse = coach
                self?.delegate?.refreshViewContents()
                if coach.response.isEmpty {
                    self?.delegate?.showSearchError()
                }
            case .failure(let error):
                self?.delegate?.showErrorMessage(error: error)
            }
        }
    }
    
    func coachData(at index: Int) -> Coach? {
        coachResponse?.response[safe: index]
    }
    
    func setTeam(selectedTeam: Team) {
        self.selectedTeam = selectedTeam
    }
    
    var numberOfCoachResults: Int {
        coachResponse?.response.count ?? 0
    }
}
