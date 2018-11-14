//
//  APIClient.swift
//  JsonCoddableUrlSession
//
//  Created by Maksim Vialykh on 08/11/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import Foundation

final class APIClient {

    let keyHolder: KeychainHolder

    init (_ keyHolder: KeychainHolder) {
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
