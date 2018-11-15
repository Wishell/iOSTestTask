//
//  PresenterModel.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation
import KeychainAccess

final class CathegoryModel: CathegoryModelInput {

    weak var output: CathegoryModelOutput!
    var holder: KeychainHolder!
    var date: Date!

    let repository = Repository(apiClient: APIClient(KeychainHolder()), keychainHolder: KeychainHolder())


    func load() {
        repository.getActivity(date.toFormattedString(format: Constants.FitBitUrlApi2.dateFormat)!) { (result) in
            switch result {
            case .success(let items):
                self.output.modelDidSucces(items)
            case .failure(let error):
                self.output.modelDidFail(error)
            }
        }
    }

}

