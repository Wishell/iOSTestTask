//
//  PresenterModelInput.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//
import KeychainAccess

protocol CathegoryModelInput {

    func load()
    var date: Date! { get set }

}
