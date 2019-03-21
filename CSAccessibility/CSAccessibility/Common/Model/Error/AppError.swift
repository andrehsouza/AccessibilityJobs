//
//  AppError.swift
//  ConcreteJobs
//
//  Created by andre.luiz.de.souza on 13/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Foundation

enum AppError: Error {
    
    case generic
    case networking
    
    var model: GenericErrorModel {
        switch self {
        default:
            return GenericErrorModel(imageName: "icAlert", message: "An unexpected error has occurred, please try again in a moment.")
        }
    }
    
}
