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
    
    var activeEnemies: [Enemy]! = [Enemy]()
    var inactiveEnemies: [Enemy]! = [Enemy]()
    
    var spawnRate: TimeInterval = TimeInterval(1)
    var currentTimer: TimeInterval = TimeInterval(0)
    
    var minY: CGFloat!
    var maxY: CGFloat!
    
    var startPosition: CGPoint?
    
    init(_ node: SKSpriteNode, scene: GameScene, spawnRate: TimeInterval = TimeInterval(1)) {
        
        super.init(node, scene: scene)
        
        self.minY = GameObject.self.getScreenHeight() / -2
        self.maxY = GameObject.getScreenHeight() / 2
        self.spawnRate = spawnRate
        
    }
    
    func createInactiveEnemy(on node: SKNode) {
        
        let newEnemyNode = self.getEnemyNode()
        
        let newEnemy = self.getEnemy(using: newEnemyNode)
        
        self.inactiveEnemies.append(newEnemy)
    }
    
    func deactivateEnemy(_ enemy: Enemy) {
        enemy.node.removeFromParent()
        self.inactiveEnemies.append(enemy)
        self.activeEnemies.removeAll { (e) -> Bool in
            return e.node == enemy.node
        }
    }
    
    func spawnEnemy(on node: SKNode) {
        
        if let newEnemy = self.inactiveEnemies.first {
            if let startPosition = self.startPosition {
                newEnemy.node.position = startPosition
            } else {
                self.startPosition = newEnemy.node.position
            }
            
            node.addChild(newEnemy.node)
            
            self.activeEnemies.append(newEnemy)
            self.inactiveEnemies.removeFirst()
            
            return
        }
        
        self.createInactiveEnemy(on: node)
        self.spawnEnemy(on: node)
    }
    
    override func update(_ deltaTime: TimeInterval) {
        
        self.currentTimer += deltaTime
        
        self.activeEnemies.forEach { $0.update(deltaTime)}
        
        self.activeEnemies.forEach { (enemy) in
            if enemy.node.position.x < -GameObject.getScreenWidth()  {
                self.deactivateEnemy(enemy)
            }
        }
    }
    
    func clearAll() {
        self.activeEnemies.forEach { $0.node.removeFromParent() }
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
    
    func canSpawn() -> Bool {
        return self.currentTimer >= self.spawnRate
    }
    
    func resetSpawnTimer() {
        self.currentTimer -= self.spawnRate
    }
    
}
