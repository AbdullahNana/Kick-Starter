//
//  TeamViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import Foundation

final class TeamViewModel {
    private lazy var teamResults = TeamData(get: "", response: [])
    
    func teamData(completionHandler: @escaping (Result<TeamData, Error>) -> Void) {
        
        var request = URLRequest(url: URL(string: "https://v3.football.api-sports.io/teams?league=39&season=2020")!, timeoutInterval: Double.infinity)
        request.addValue("a32ada5a87b8d582f0e4a9fb60c6cdfd", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            guard let data = data else { return }
            
            do {
                let decodedWeatherData = try JSONDecoder().decode(TeamData.self, from: data)
                completionHandler(.success(decodedWeatherData))
                
            } catch let error as NSError {
                completionHandler(.failure(error))
                print(error)
            }
            
        }.resume()
    }
    
    func loadTeamData(completion: @escaping (TeamData) -> Void) {
            teamData { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let team):
                        self.teamResults = team
                        completion(team)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        
    }
    
    var teamData: TeamData {
        teamResults
    }
}
