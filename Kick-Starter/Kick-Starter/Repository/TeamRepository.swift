//
//  TeamRepository.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/05.
//

import Foundation

final class TeamRepository {
    func teamData(method: HTTPMethod, endpoint: ApiEndpoint, completionHandler: @escaping (Result<TeamData, Error>) -> Void) {
        let urlString = endpoint.rawValue
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.addValue(Constants.APIKey, forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        
        request.httpMethod = method.rawValue
        
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

extension TeamRepository {
    enum HTTPMethod: String {
        case GET
        case POST
    }
    
    enum ApiEndpoint: String {
        case teamData = "https://v3.football.api-sports.io/teams?league=39&season=2020"
        case leagueData = "https://v3.football.api-sports.io/leagues?id=39"
    }
}
