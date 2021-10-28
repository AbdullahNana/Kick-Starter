//
//  LiveScoreViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/21.
//

import Foundation

final class LiveScoreViewModel {
    func liveScoreURL() -> URLRequest {
        let localFilePath = Bundle.main.url(forResource: "livescore", withExtension: "html")
        return URLRequest(url: localFilePath!)
    }
}
