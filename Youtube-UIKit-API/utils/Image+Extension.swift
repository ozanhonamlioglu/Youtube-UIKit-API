//
//  Image+Extension.swift
//  Youtube-UIKit-API
//
//  Created by ozy on 3.09.2021.
//

import UIKit

extension UIImage {

    func resize(targetSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size:targetSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }

}
