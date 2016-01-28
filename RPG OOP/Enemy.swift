//
//  Enemy.swift
//  RPG OOP
//
//  Created by Jake Ojero on 2016-01-28.
//  Copyright © 2016 Jake Ojero. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return ["Rusty Dagger","Cracked Buckle"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
        
    }
}