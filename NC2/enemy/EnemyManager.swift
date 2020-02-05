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

class EnemyManager: GameObject {
    
    var enemies: [Enemy]! = [Enemy]()
    var spawnRate: TimeInterval = TimeInterval(1)
    var currentTimer: TimeInterval = TimeInterval(0)
    
    init(_ node: SKSpriteNode, spawnRate: TimeInterval) {
        super.init(node)
        
        self.spawnRate = spawnRate
    }
    
    func spawnEnemy() {
        let newEnemyNode = SKSpriteNode()
        newEnemyNode.position = CGPoint(x: self.getScreenWidth(), y: CGFloat.random(in: -self.getScreenHeight()...self.getScreenHeight()))
        
        let newEnemy = LaserEnemy(newEnemyNode)
        
        self.enemies.append(newEnemy)
        
        self.node.addChild(newEnemy.node)
    }
    
    
    override func update(_ deltaTime: TimeInterval) {
        
        self.currentTimer += deltaTime

        if currentTimer >= spawnRate {
            
            self.spawnEnemy()
            
            currentTimer -= spawnRate
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