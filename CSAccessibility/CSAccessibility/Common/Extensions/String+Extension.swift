//
//  String+Extension.swift
//  ConcreteJobs
//
//  Created by andre.luiz.de.souza on 13/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Foundation

extension String {
    
    var htmlToString: String {
        guard let data = data(using: .utf8) else { return "" }
        do {
            let htmlText = try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html,
                                                                        .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            
            return htmlText.string
        } catch {
            return ""
        }
    }
    
}
