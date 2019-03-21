//
//  JobDetailPresenter.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 22/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Foundation

final class JobDetailPresenter: JobDetailPresenterProtocol {
   
    private weak var view: JobDetailViewProtocol?
    
    var job: JobModel
    
    init(with job: JobModel) {
        self.job = job
    }
    
    func attachView(view: JobDetailViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setJobTitle(job.title)
        view?.setJobDescription(job.jobDescription)
        view?.setJobLocation(job.location.capitalized)
    }
    
}
