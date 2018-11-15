//
//  PresenterModel.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation
import KeychainAccess

final class PresenterModel: PresenterModelInput {

    weak var output: PresenterModelOutput!
    var holder: KeychainHolder!
    var date: String!

    let repository = Repository(apiClient: APIClient(KeychainHolder()), keychainHolder: KeychainHolder())


    func load() {
        repository.getActivity(date) { (result) in
            switch result {
            case .success(let items):
                self.output.modelDidSucces(items)
            case .failure(let error):
                self.output.modelDidFail(error)
            }
        }
    }

}

