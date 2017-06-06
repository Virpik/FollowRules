//
//  Rule.swift
//  FollowRule
//
//  Created by Virpik on 31/05/2017.
//  Copyright © 2017 Virpik. All rights reserved.
//

import Foundation

protocol Rule {
    var isTrue: Bool { get }
}


extension LogicOperator {
    func apply(rules: Rule...) -> Bool {
        return self.apply(rules: rules)
    }
    
    func apply(rules: [Rule]) -> Bool {
        var methods: [LogicOperator: ((Bool,Bool) -> Bool)] = [:]
        
        methods[.and] = self.andOperation(rule1:rule2:)
        methods[.or] = self.orOperation(rule1:rule2:)
        
        let method = methods[self]!
        
        var result: Bool = rules.first?.isTrue ?? true
        
        for rule in rules {
            result = method(result, rule.isTrue)
        }
        
        return result
    }
    
    func andOperation(rule1: Bool, rule2: Bool) -> Bool {
        return rule1 && rule2
    }
    
    func orOperation(rule1: Bool, rule2: Bool) -> Bool {
        return rule1 || rule2
    }
}
