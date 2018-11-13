//  
//  AutorizationModel.swift
//  FitBitApi
//
//  Created by Wishell on 13.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation
import KeychainAccess

final class AutorizationModel: AutorizationModelInput {
    
    weak var output: AutorizationModelOutput!
    let repository = Repository(apiClient: APIClient())
    
    func load(){
        repository.getActivity{ (result) in
            switch result {
            case .success(let items):
                //self.output.modelDidSucces(items)
            case .failure(let error):
                //self.output.modelDidFail()
            }
        }
    }
}
