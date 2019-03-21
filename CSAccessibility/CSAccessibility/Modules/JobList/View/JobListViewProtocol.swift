//
//  JobListViewProtocol.swift
//  ConcreteJobs
//
//  Created by andre.luiz.de.souza on 12/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Foundation

protocol JobListViewProtocol: class {
    func showError(with errorModel: GenericErrorModel)
    func showLoading(_ show: Bool)
    func showJobList(_ show: Bool)
    func hideError()
    func reloadData()
    func pushDetailViewController(with job: JobModel, colors: JobColor)
}
