//
//  FollowRules.swift
//  FollowRule
//
//  Created by Virpik on 31/05/2017.
//  Copyright © 2017 Virpik. All rights reserved.
//

import Foundation

class FollowRules {
    private var mainRule: RuleDepended
    
    var isTrue: Bool {
        return self.mainRule.isTrue
    }
    
    init() {
        self.mainRule = RuleDepended(logicOperator: .and)
    }
    
    func add(rule: Rule) {
        self.mainRule.add(rule: rule)
    }
    
    func add(rules: [Rule]) {
        self.mainRule.add(rules: rules)
    }
    
    func addAnd(rules: Rule...) {
        self.addAnd(rules: rules)
    }
    
    func addAnd(rules: [Rule]) {
        let ruleDepended = RuleDepended(rules: rules, logicOperator: .and)
        self.add(rule: ruleDepended)
    }
    
    func addOr(rules: Rule...) {
        self.addOr(rules: rules)
    }

    func addOr(rules: [Rule]) {
        let ruleDepended = RuleDepended(rules: rules, logicOperator: .or)
        self.add(rule: ruleDepended)
    }
}
