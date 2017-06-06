//
//  RuleDepended.swift
//  FollowRule
//
//  Created by Virpik on 31/05/2017.
//  Copyright © 2017 Virpik. All rights reserved.
//

import Foundation

struct RuleDepended: Rule {
    
    var isTrue: Bool {
        return self.logicOperator.apply(rules: self.rules)
    }
    
    private(set) var rules: [Rule] = []
    private(set) var logicOperator: LogicOperator
    
    init(logicOperator: LogicOperator) {
        self.logicOperator = logicOperator
    }
    
    init(rule: Rule, logicOperator: LogicOperator = .and) {
        self.rules = [rule]
        self.logicOperator = logicOperator
    }
    
    init(rules: [Rule], logicOperator: LogicOperator = .and) {
        self.rules = rules
        self.logicOperator = logicOperator
    }
    
    mutating func add(rule: Rule) {
        self.rules.append(rule)
    }
    
    mutating func add(rules: [Rule]) {
        self.rules.append(contentsOf: rules)
    }
    
    mutating func add(rules: Rule...) {
        self.add(rules: rules)
    }
}
