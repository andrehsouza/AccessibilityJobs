//
//  UILabel+Extension.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 27/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import UIKit

extension UILabel {
    
    func hyphenText(_ text: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.hyphenationFactor = 1.0
        
        let hyphenAttribute: [NSAttributedString.Key : Any] = [NSAttributedString.Key.paragraphStyle : paragraphStyle,
                                                               NSAttributedString.Key.font : font]
        
        self.attributedText = NSMutableAttributedString(string: text, attributes: hyphenAttribute)
    }
    
}
