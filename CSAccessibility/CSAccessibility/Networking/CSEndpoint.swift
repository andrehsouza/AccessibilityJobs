//
//  CSEndpoint.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 18/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Foundation

enum CSEndpoint {
    
    case job
    
    var url: String {
        switch self {
        case .job:
            return "https://www.concrete.com.br/jobs.json"
        }
    }
    
}
