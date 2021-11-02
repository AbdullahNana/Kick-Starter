//
//  SingleFixtureViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/02.
//

import Foundation

final class SingleFixtureViewModel {
    func fixtureURL() -> URLRequest {
        let localFilePath = Bundle.main.url(forResource: "single fixture", withExtension: "html")
        return URLRequest(url: localFilePath!)
    }
}
