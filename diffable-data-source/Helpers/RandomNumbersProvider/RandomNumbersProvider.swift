//
//  RandomNumbersProvider.swift
//  diffable-data-source
//
//  Created by Josip Rezic on 31/01/2020.
//  Copyright © 2020 Josip Rezic. All rights reserved.
//

import Foundation

struct RandomNumbersProvider {
    
    //
    // MARK:
    //
    
    var currentState = [RandomNumber]()
    
    //
    // MARK: - Initializers
    //
    
    init() {
        for index in 1...100 { currentState.append(RandomNumber(value: index)) }
    }
    
    //
    // MARK: - Methods
    //
    
    mutating func updateCurrentState() {
        currentState.removeAll()
        for item in 1...100 {
            if Bool.random() {
                currentState.append(RandomNumber(value: item))
            }
        }
    }
}
