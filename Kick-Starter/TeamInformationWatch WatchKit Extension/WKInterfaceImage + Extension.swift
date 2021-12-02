//
//  WKInterfaceImage + Extension.swift
//  TeamInformationWatch WatchKit Extension
//
//  Created by Abdullah Nana on 2021/11/30.
//

import Foundation
import WatchKit

extension WKInterfaceImage {
    func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        self.setImage(UIImage(named: "logo"))
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.setImage(image)
                    }
                }
            }
        }
    }
}
