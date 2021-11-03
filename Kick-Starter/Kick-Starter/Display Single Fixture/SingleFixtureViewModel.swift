//
//  SingleFixtureViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/02.
//

import Foundation

final class SingleFixtureViewModel {
    func fixtureURL() -> URL? {
        return Bundle.main.url(forResource: "single fixture", withExtension: "html")
    }
}
