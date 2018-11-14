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
    
    let repository = Repository(apiClient: APIClient(KeychainHolder()), keychainHolder: KeychainHolder())
    
    func load(){
        repository.getActivity(holder) { (result) in
            switch result {
            case .success(let items):
                self.output.modelDidSucces(items)
            case .failure(let error):
                self.output.modelDidFail()
            }
        }
    }
    
}

