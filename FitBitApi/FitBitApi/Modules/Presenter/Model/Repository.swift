//
//  Repository.swift
//  JsonCoddableUrlSession
//
//  Created by Maksim Vialykh on 08/11/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import Foundation

// TODO: - Move to the separated file UserData.swift
struct Activity: Codable {
    let categories: [Category]
}

struct Category: Codable {
    let activities: [ActivityElement]
    let id: Int
    let name: String
    let subCategories: [Category]?
}

struct ActivityElement: Codable {
    let activityLevels: [ActivityLevel]?
    let hasSpeed: Bool
    let id: Int
    let name: String
    let mets: Double?
}

struct ActivityLevel: Codable {
    let id: Int
    let maxSpeedMPH, mets, minSpeedMPH: Double
    let name: String
}

enum ActivityType: String {
    case activities = "/activities"
    case heartrate = "/heart"
}
enum FormatType: String {
    case json = ".json"
}

struct FitBitUrlApi {
    let prefixUrl = "https://api.fitbit.com/1"
    var User: String
    var activityType: String
    var date: String
    var formatType: String
    
    func getUrl() -> URL{
        return URL(string: prefixUrl + User + activityType + date + formatType)!
    }
}



final class Repository {
    
    private let apiClient: APIClient!
    private let holder: KeychainHolder!
    
    init(apiClient: APIClient, keychainHolder: KeychainHolder) {
        self.apiClient = apiClient
        self.holder = keychainHolder
    }
    
    func getActivity(_ params: KeychainHolder, _ completion: @escaping ((Result<Activity>) -> Void)) {
        
        let fitBitUrlApi = FitBitUrlApi(User: "/user/\(params["fitbit.userId"]!)", activityType: ActivityType.activities.rawValue, date: "/2018-11-11", formatType: FormatType.json.rawValue )
        let resource = Resource(url: fitBitUrlApi.getUrl())
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
