//
//  TeamRepository.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/05.
//

import Foundation

final class TeamRepository {
    func teamData(completionHandler: @escaping (Result<TeamData, Error>) -> Void) {
        
        var request = URLRequest(url: URL(string: "https://v3.football.api-sports.io/teams?league=39&season=2020")!, timeoutInterval: Double.infinity)
        request.addValue(Constants.APIKey, forHTTPHeaderField: "x-rapidapi-key")
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
}
