//
//  PresenterModelOutput.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

protocol PresenterModelOutput: class {

    func modelDidSucces(_ data: Activity)
    func modelDidFail(_ error: Error?)

}