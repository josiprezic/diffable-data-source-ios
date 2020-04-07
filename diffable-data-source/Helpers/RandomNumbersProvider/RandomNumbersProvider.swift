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
    // MARK: - Properties
    //
    
    var currentState = [RandomNumber]()
    var currentMaxNumber = 100
    var numberOfNewRows = 20
    
    //
    // MARK: - Initializers
    //
    
    init() {
        for index in 1...currentMaxNumber { currentState.append(RandomNumber(value: index)) }
    }
    
    //
    // MARK: - Methods
    //
    
    mutating func updateCurrentState() {
        currentState.removeAll()
        for item in 1...currentMaxNumber {
            if Bool.random() {
                currentState.append(RandomNumber(value: item))
            }
        }
    }
    
    mutating func addMoreRows() {
        for item in currentMaxNumber + 1...currentMaxNumber + numberOfNewRows {
            currentState.append(RandomNumber(value: item))
        }
        currentMaxNumber += numberOfNewRows
    }
}
