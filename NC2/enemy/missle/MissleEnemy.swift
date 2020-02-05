//
//  MissleEnemy.swift
//  NC2
//
//  Created by Bruno Pastre on 05/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit
import GameplayKit

class MissleEnemy: Enemy {
    
    var timeSinceSpawn: TimeInterval = TimeInterval(0)
    let stateMachine = GKStateMachine(states: [MissleTracking(), MissleShooting() ])
    
    
    let shootThreshold = TimeInterval(5)
    
    override func getPhysicsBody() -> SKPhysicsBody {
        return SKPhysicsBody(circleOfRadius: 20)
    }
    
    override func configureEnemyTextures() {
        let sphere = SKShapeNode(circleOfRadius: 20)
        
        sphere.fillColor = .blue
        
        self.node.addChild(sphere)
        
        self.speed = 2 * super.speed
        
    }
    
    override func update(_ deltaTime: TimeInterval) {
        super.update(deltaTime)
        self.timeSinceSpawn += deltaTime

        if timeSinceSpawn > self.shootThreshold {
            self.stateMachine.enter(MissleShooting.self)
        }

        if self.stateMachine.currentState is MissleTracking {
            self.updateTracking()
            return
        }

        self.updateShooting()
    }
    
    func updateTracking() {
        
    }
    
    func updateShooting() {
        
    }
    
    
    
    override func getNodeName() -> String {
        return "enemyMissle"
    }
}
