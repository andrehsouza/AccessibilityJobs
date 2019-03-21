//
//  DescribeProtocol.swift
//  ConcreteJobs
//
//  Created by andre.luiz.de.souza on 12/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Foundation

protocol DescribeProtocol: class { }

extension DescribeProtocol where Self: NSObject {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
