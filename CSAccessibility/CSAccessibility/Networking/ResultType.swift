//
//  ResultType.swift
//  ConcreteJobs
//
//  Created by andre.luiz.de.souza on 12/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Foundation

enum ResultType<T> {
    case success(T)
    case failure(AppError)
}
