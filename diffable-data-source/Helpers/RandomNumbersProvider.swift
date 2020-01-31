//
//  RandomNumbersProvider.swift
//  diffable-data-source
//
//  Created by Josip Rezic on 31/01/2020.
//  Copyright © 2020 Josip Rezic. All rights reserved.
//

import Foundation

struct RandomNumbersProvider {
    
    private var allNumbers = [RandomNumber]()
    var currentState = [RandomNumber]()
    
    init() {
        for index in 1...100 { allNumbers.append(RandomNumber(value: index)) }
        currentState = allNumbers
    }
    
    mutating func updateCurrentState() {
        currentState.removeAll()
        for item in 1...100 {
            if Bool.random() {
                currentState.append(RandomNumber(value: item))
            }
        }
    }
}
