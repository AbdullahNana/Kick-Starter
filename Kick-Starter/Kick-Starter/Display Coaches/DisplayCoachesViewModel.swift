//
//  DisplayCoachesViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/16.
//

import Foundation
import KickStarterFramework

final class DisplayCoachesViewModel {
    private var coachResponse: CoachResponseModel?
    private(set) var selectedTeam: Team?
    private var caochRepository: CoachRepositable
    private weak var delegate: ViewModelDelegate?
    
    init(repository: CoachRepositable, delegate: ViewModelDelegate) {
        self.caochRepository =  repository
        self.delegate = delegate
    }
    
    func endpoint(team: String) -> String {
        "https://v3.football.api-sports.io/coachs?team=\(team)"
    }
    
    func fetchCoachData(endpoint: String) {
        caochRepository.fetchCoachData(method: .GET, endpoint: endpoint) { [weak self] result in
            switch result {
            case .success(let coach):
                self?.coachResponse = coach
                self?.delegate?.refreshViewContents()
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
