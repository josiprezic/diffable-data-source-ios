//
//  RandomNumber.swift
//  diffable-data-source
//
//  Created by Josip Rezic on 31/01/2020.
//  Copyright © 2020 Josip Rezic. All rights reserved.
//

import Foundation

struct RandomNumber {
    
    //
    // MARK: - Properties
    //
    
    let value: Int
}

//
// MARK: - Extension - Hashable
//

extension RandomNumber: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
    
    static func == (lhs: RandomNumber, rhs: RandomNumber) -> Bool {
        return lhs.value == rhs.value
    }
}
