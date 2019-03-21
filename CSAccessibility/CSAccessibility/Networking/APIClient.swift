//
//  APIClient.swift
//  ConcreteJobs
//
//  Created by andre.luiz.de.souza on 12/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import Alamofire

protocol APIClient {
    func get<T: Decodable>(url: URL, completion: @escaping (ResultType<T>) -> Void)
}

final class RequestAPIClient: APIClient {
    
    private let sessionManager: SessionManager
    
    init(sessionManager: SessionManager = SessionManager()) {
        self.sessionManager = sessionManager
    }
    
    func get<T>(url: URL, completion: @escaping (ResultType<T>) -> Void) where T : Decodable {
        sessionManager.request(url, method: .get, encoding: JSONEncoding()).validate(statusCode: 200 ..< 300).responseData { response in
            switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let object = try JSONDecoder().decode(T.self, from: data)
                            completion(.success(object))
                        } catch {
                            completion(.failure(.generic))
                        }
                    } else {
                        completion(.failure(.networking))
                    }
                
                case .failure:
                    completion(.failure(.networking))
            }
        }
    }
    
}
