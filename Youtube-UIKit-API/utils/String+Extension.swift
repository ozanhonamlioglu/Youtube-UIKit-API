//
//  String+Extensions.swift
//  Youtube-UIKit-API
//
//  Created by ozy on 23.08.2021.
//

import UIKit

extension String {
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
}
