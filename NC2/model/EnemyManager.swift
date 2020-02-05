//
//  EnemyManager.swift
//  NC2
//
//  Created by Bruno Pastre on 04/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

enum ContactMask: UInt32 {
    case player = 0b1
    case enemy = 0b10
    case coin = 0b100
    case ground = 0b10000
    
    case none = 0b00000000000000000000000000000000
}

class EnemiesManager: GameObject {
    
    var enemies: [Enemy]! = [Enemy]()
    var timer: TimeInterval = TimeInterval(1)
    var currentTimer: TimeInterval = TimeInterval(0)
    
    
    func spawnEnemy() {
        let newEnemyNode = SKSpriteNode()
        newEnemyNode.position = CGPoint(x: self.getScreenWidth(), y: CGFloat.random(in: -self.getScreenHeight()...self.getScreenHeight()))
        
        let newEnemy = LaserEnemy(newEnemyNode)
        
        self.enemies.append(newEnemy)
        
        self.node.addChild(newEnemy.node)
    }
    
    
    override func update(_ deltaTime: TimeInterval) {
        
        currentTimer += deltaTime

        if currentTimer >= timer {
            
            self.spawnEnemy()
            
            currentTimer -= timer
        }
        
        self.enemies.forEach { $0.update(deltaTime)}
        
        self.enemies.forEach { (enemy) in
            if enemy.node.position.x < -self.getScreenWidth()  {
                enemy.node.removeFromParent()
            }
        }
        
    }
    
    override func getNodeName() -> String {
        return "enemiesManager"
    }
    
}
