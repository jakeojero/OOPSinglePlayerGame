//
//  DevilWizard.swift
//  RPG OOP
//
//  Created by Jake Ojero on 2016-01-28.
//  Copyright © 2016 Jake Ojero. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}