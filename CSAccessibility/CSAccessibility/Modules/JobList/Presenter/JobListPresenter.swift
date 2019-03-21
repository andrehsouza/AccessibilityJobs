//
//  JobListPresenter.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 12/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Foundation

final class JobListPresenter: JobListPresenterProtocol {
    
    internal weak var view: JobListViewProtocol?
    private let jobService: JobServiceProtocol
    
    var jobList: [JobModel] = []
    
    init(jobService: JobServiceProtocol = JobService()) {
        self.jobService = jobService
    }
    
    func attachView(view: JobListViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.showJobList(false)
        getJobs()
    }
    
    func getJobs() {
        view?.hideError()
        view?.showLoading(true)
        
        jobService.getJobList() { [weak self] result in
            self?.view?.showLoading(false)
            switch result {
            case .success(let jobs):
                self?.jobList = jobs
                self?.showViewContent()
            case .failure(let error):
                self?.view?.showError(with: error.model)
            }
        }
    }
    
}

private extension JobListPresenter {
    
    func showViewContent() {
        view?.hideError()
        view?.showJobList(true)
        view?.reloadData()
    }
    
}
