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
    
    convenience init(_ node: SKSpriteNode, spawnRate: TimeInterval = TimeInterval(1)) {
        
        self.init(node)
        
        self.spawnRate = spawnRate
    }
    
    required override init(_ node: SKSpriteNode) {
        super.init(node)
    }
    
    func spawnEnemy() {
        let newEnemyNode = self.getEnemyNode()
        
        let newEnemy = self.getEnemy(using: newEnemyNode)
        
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
    
    func getEnemyNode() -> SKSpriteNode {
        fatalError("\(self) did not implement getEnemyNode")
    }
    
    func getEnemy(using node: SKSpriteNode) -> Enemy {
        fatalError("\(self) did not implement getEnemyNode")
    }
    
    
}
