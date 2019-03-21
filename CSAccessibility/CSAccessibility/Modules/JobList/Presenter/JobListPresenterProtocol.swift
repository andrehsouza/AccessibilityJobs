//
//  JobListPresenterProtocol.swift
//  ConcreteJobs
//
//  Created by andre.luiz.de.souza on 12/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Foundation

protocol JobListPresenterProtocol: class {
    var view: JobListViewProtocol? { get }
    var jobList: [JobModel] { get }
    func attachView(view: JobListViewProtocol)
    func viewDidLoad()
    func getJobs()
}
