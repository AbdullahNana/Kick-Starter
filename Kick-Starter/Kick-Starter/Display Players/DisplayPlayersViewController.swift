//
//  DisplayPlayersViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/15.
//

import UIKit

class DisplayPlayersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "singleVenueViewSegue", sender: self )
    }
}
