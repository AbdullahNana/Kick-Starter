//
//  UIImageView+Extensions.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/06.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.image = UIImage(systemName: "circle.fill")
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    self?.image = image
                }
            }
        }
    }
}
