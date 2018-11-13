//  
//  AutorizationModelOutput.swift
//  FitBitApi
//
//  Created by Wishell on 13.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

protocol AutorizationModelOutput: class {
    func modelDidSucces(_ data: Activity)
    func modelDidFail()
}
