//
//  LeagueViewModelDelegate.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/21.
//

import Foundation

protocol LeagueViewModelDelegate: AnyObject {
    func refreshViewContents()
    func showErrorMessage(error: Error)
}
