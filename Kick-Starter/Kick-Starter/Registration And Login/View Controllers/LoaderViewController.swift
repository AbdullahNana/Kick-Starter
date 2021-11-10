//
//  LoaderViewController.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/10.
//

import UIKit

class LoaderViewController: UIViewController {
    private var loader = UIActivityIndicatorView(style: .large)
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .loaderColor
        
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.startAnimating()
        view.addSubview(loader)
        
        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    public func start(container: UIViewController) {
        container.addChild(self)
        self.view.frame = container.view.frame
        container.view.addSubview(self.view)
        self.didMove(toParent: container)
    }
    
    public func stop() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
}
