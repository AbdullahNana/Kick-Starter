//
//  LeagueRepository.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/21.
//

import Foundation

final class LeagueRepository: LeagueRepositable {
    func fetchLeagueData(completionHandler: @escaping LeagueRepositoryResultBlock) {
        let urlString = "https://\(Constants.AppID).firebaseio.com/leagues.json"
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            guard let data = data else { return }
            
            do {
                let decodedTeamData = try JSONDecoder().decode([LeagueModel].self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(decodedTeamData))
                }
                
            } catch let error as NSError {
                    completionHandler(.failure(error))
            }
            
        }.resume()
    }
}
