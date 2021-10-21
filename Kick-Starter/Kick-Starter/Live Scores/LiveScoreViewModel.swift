//
//  LiveScoreViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/21.
//

import Foundation

final class LiveScoreViewModel {
    func liveScoreURL() -> URL? {
        let url = URL(string: Constants.liveScores)
        return url
    }
}
