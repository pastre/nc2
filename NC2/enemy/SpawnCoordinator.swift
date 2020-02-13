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

class MyGaussianDistribution {
    private let randomSource: GKRandomSource
    let mean: Float
    let deviation: Float

    init(randomSource: GKRandomSource, mean: Float, deviation: Float) {
        precondition(deviation >= 0)
        self.randomSource = randomSource
        self.mean = mean
        self.deviation = deviation
    }

    func nextFloat() -> Float {
        guard deviation > 0 else { return mean }

        let x1 = randomSource.nextUniform() // a random number between 0 and 1
        let x2 = randomSource.nextUniform() // a random number between 0 and 1
        let z1 = sqrt(-2 * log(x1)) * cos(2 * Float.pi * x2) // z1 is normally distributed

        // Convert z1 from the Standard Normal Distribution to our Normal Distribution
        return z1 * deviation + mean
    }
}
