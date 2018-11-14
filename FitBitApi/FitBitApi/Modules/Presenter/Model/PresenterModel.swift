//  
//  PresenterModel.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation

final class PresenterModel: PresenterModelInput {
    
    weak var output: PresenterModelOutput!
    let repository = Repository(apiClient: APIClient())
    
    func load(){
        repository.getActivity{ (result) in
            switch result {
            case .success(let items):
                self.output.modelDidSucces(items)
            case .failure(let error):
                self.output.modelDidFail()
            }
        }
    }
}
