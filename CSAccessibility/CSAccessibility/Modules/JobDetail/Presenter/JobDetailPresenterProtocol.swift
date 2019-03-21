//
//  JobDetailPresenterProtocol.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 22/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Foundation

protocol JobDetailPresenterProtocol: class {
    var job: JobModel { get }
    func attachView(view: JobDetailViewProtocol)
    func viewDidLoad()
}
