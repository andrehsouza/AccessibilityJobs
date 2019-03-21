//
//  JobDetailViewProtocol.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 22/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Foundation

protocol JobDetailViewProtocol: class {
    func setJobTitle(_ title: String)
    func setJobDescription(_ description: String)
    func setJobLocation(_ local: String) 
}
