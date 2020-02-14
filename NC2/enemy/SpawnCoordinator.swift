//
//  SpawnCoordinator.swift
//  NC2
//
//  Created by Bruno Pastre on 05/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit
import GameplayKit

class SpawnCoordinator: EnemyManager {
    
    let coinSpawner = CoinSpawner()
    var managers: [EnemyManager]!
    var nextSpawnThreshold = TimeInterval(0)
    let distribution = MyGaussianDistribution(randomSource: .init(), mean: 1, deviation: 0.5)
    
    override init(_ node: SKSpriteNode, scene: GameScene, spawnRate: TimeInterval = TimeInterval(1)) {
        super.init(node, scene: scene)
        self.managers = [
            LaserEnemyManger(node, scene: scene),
            MissleEnemyManager(node, scene: scene),
            PenguinEnemyManager(node, scene: scene)
        ]
    }
    
    override func clearAll() {
        self.managers.forEach { $0.clearAll() }
    }
    
    func spawn() {
        
        let random = Int.random(in: 0...100)
        
        if random < 25 {
            self.coinSpawner.spawnCoinStructure(on: self.node)
            return 
        }
        
        if random < 50 {
            self.managers[0].spawnEnemy(on: self.node)
            return
        }
        
        if random < 70 {
            self.managers[1].spawnEnemy(on: self.node)
            return
        }

        self.managers[2].spawnEnemy(on: self.node)
    }
    
    override func update(_ deltaTime: TimeInterval)  {
        self.currentTimer += deltaTime
        
        if currentTimer > nextSpawnThreshold {
            self.spawn()
            self.currentTimer -= nextSpawnThreshold
            self.nextSpawnThreshold = TimeInterval(self.distribution.nextFloat())
        }
        
        self.managers.forEach { $0.update(deltaTime) }
    }
}

