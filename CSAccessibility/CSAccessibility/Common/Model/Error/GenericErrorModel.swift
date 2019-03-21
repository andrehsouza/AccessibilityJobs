//
//  GenericErrorModel.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 18/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import UIKit

struct GenericErrorModel {
    
    let imageName: String
    let imageColor: UIColor
    let message: String
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    init(imageName: String, imageColor: UIColor = .black, message: String) {
        self.imageName = imageName
        self.imageColor = imageColor
        self.message = message
    }
    
}
