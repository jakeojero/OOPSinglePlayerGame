//
//  ViewController.swift
//  RPG OOP
//
//  Created by Jake Ojero on 2016-01-28.
//  Copyright © 2016 Jake Ojero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {




    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var chestButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Dirty Laundry21", hp: 110, attackPwr: 20)
        randomEnemy()
        playerHpLbl.text = "\(player.hp) HP"
        enemyHpLbl.text = "\(enemy.hp) HP"
    }
    
    func randomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
            enemyHpLbl.text = "\(enemy.hp) HP"
            enemyImg.image = UIImage(named: "enem1")
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
            enemyHpLbl.text = "\(enemy.hp) HP"
            enemyImg.image = UIImage(named: "enem2")
        }
        
        enemyImg.hidden = false
    }
    
    @IBAction func onChestTapped(sender: AnyObject) {
        chestButton.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "randomEnemy", userInfo: nil, repeats: false)
    }
    

    @IBAction func onAttackPressed(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was Unsuccessful"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInv(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
    }
    
    
    
}

