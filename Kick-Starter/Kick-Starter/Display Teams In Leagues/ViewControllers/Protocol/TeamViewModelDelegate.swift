//
//  TeamViewModelDelegate.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/06.
//

import Foundation

protocol TeamViewModelDelegate: AnyObject {
    func refreshViewContents()
    func showErrorMessage(error: Error)
}
