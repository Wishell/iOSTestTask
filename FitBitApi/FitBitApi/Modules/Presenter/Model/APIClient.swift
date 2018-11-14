//
//  APIClient.swift
//  JsonCoddableUrlSession
//
//  Created by Maksim Vialykh on 08/11/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import Foundation
import KeychainAccess

// TODO: - Move to the separated file Resource.swift
struct Resource {
    let url: URL
    let method: String = "GET"
}

// TODO: - Move to the separated file GenericResult.swift
enum Result<T> {
    case success(T)
    case failure(Error)
}

enum APIClientError: Error {
    case noData
}

// TODO: - Move to the separated file URLRequest+Resource.swift
extension URLRequest {
    
    init(_ resource: Resource) {
        self.init(url: resource.url)
        self.httpMethod = resource.method
    }
    
}

final class APIClient {
    
    let keyHolder: KeychainHolder
    
    init (_ keyHolder: KeychainHolder){
        self.keyHolder = keyHolder
    }
    
    func load(_ resource: Resource, result: @escaping ((Result<Data>) -> Void)) {
        var request = URLRequest(resource)
        request.allHTTPHeaderFields?["Authorization"] = keyHolder["fitbit.token"]
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let `data` = data else {
                result(.failure(APIClientError.noData))
                return
            }
            if let `error` = error {
                result(.failure(error))
                return
            }
            result(.success(data))
        }
        task.resume()
    }
    
}
