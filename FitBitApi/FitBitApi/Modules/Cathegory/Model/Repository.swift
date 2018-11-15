//
//  Repository.swift
//  JsonCoddableUrlSession
//
//  Created by Maksim Vialykh on 08/11/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import Foundation

final class Repository {

    private let apiClient: APIClient!
    private let holder: KeychainHolder!
    private func buildUrl(date: String, activities: ActivityType) -> URL? {
        guard let userId = holder.keychain["fitbit.userId"],
            let fitBitUrl = URL(string: Constants.FitBitUrlApi2.prefixUrl + userId + activities.rawValue + "/" + date + Constants.FitBitUrlApi2.formatType)
            else { return nil }
        return fitBitUrl
    }

    init(apiClient: APIClient, keychainHolder: KeychainHolder) {
        self.apiClient = apiClient
        self.holder = keychainHolder
    }

    func getActivity(_ date: String, _ completion: @escaping ((Result<Activity>) -> Void)) {

        guard let fitBitUrl = buildUrl(date: date, activities: ActivityType.activities) else { return }

        let resource = Resource(url: fitBitUrl)
        apiClient.load(resource) { (result) in
            switch result {
            case .success(let data):
                do {
                    let items = try JSONDecoder().decode(Activity.self, from: data)
                    completion(.success(items))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
