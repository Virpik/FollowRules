//
//  EmptyRule.swift
//  FollowRule
//
//  Created by Virpik on 31/05/2017.
//  Copyright © 2017 Virpik. All rights reserved.
//

import Foundation

struct EmptyRule: Rule {
    var isTrue: Bool {
        return self.block()
    }
    
    var block: (() -> Bool)
    
    init(block: @escaping (() -> Bool)) {
        self.block = block
    }
}
