//
//  JobService.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 18/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Foundation

protocol JobServiceProtocol {
    func getJobList(completion: @escaping ((ResultType<[JobModel]>) -> Void))
}

final class JobService: JobServiceProtocol {
    
    private let apiClient: APIClient
    private let baseURL = URL(string: CSEndpoint.job.url)!
    
    init(apiClient: APIClient = RequestAPIClient()) {
        self.apiClient = apiClient
    }
    
    func getJobList(completion: @escaping ((ResultType<[JobModel]>) -> Void)) {
        apiClient.get(url: baseURL, completion: completion)
    }
    
}
