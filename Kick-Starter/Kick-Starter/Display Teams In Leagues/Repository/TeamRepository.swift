//
//  TeamRepository.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/05.
//

import Foundation

final class TeamRepository: Repositable {
    func fetchTeamData(method: HTTPMethod, endpoint: ApiEndpoint, completionHandler: @escaping TeamRepositoryResultBlock ) {
        let urlString = endpoint.rawValue
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.addValue(Constants.APIKey, forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        
        request.httpMethod = method.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            guard let data = data else { return }
            
            do {
                let decodedWeatherData = try JSONDecoder().decode(SoccerTeamResponseModel.self, from: data)
                completionHandler(.success(decodedWeatherData))
                
            } catch let error as NSError {
                completionHandler(.failure(error))
            }
            
        }.resume()
    }
}
