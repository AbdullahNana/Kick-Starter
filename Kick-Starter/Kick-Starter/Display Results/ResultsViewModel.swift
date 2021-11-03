//
//  LiveScoreViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/21.
//

import Foundation

final class ResultsViewModel {
    func resultsURL(result: String) -> URL? {
        return Bundle.main.url(forResource: result, withExtension: "html")
//        return URLRequest(url: localFilePath)
    }
}
