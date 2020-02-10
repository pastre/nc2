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
        return SKPhysicsBody(texture: SKTexture(imageNamed: "missle"), alphaThreshold: 0.9, size: self.getSize())
    }
    
    override func configureEnemyTextures() {
        self.stateMachine.enter(MissleTracking.self)
        
//        let sphere = SKShapeNode(circleOfRadius: 20)
    
        let node = SKSpriteNode(imageNamed: "missle")
        
//        sphere.fillColor = .blue
        
        node.scale(to: self.getSize())
        node.zPosition = ZPositionManager.MISSLE.rawValue
        
        self.node.addChild(node)
        
        
    }
    
    override func update(_ deltaTime: TimeInterval) {
        
        self.timeSinceSpawn += deltaTime
        
        if timeSinceSpawn > self.shootThreshold {
            self.stateMachine.enter(MissleShooting.self)
        }

        if self.stateMachine.currentState is MissleTracking {
            self.updateTracking()
            return
        }
        
        super.update(deltaTime)
    }
    
    func updateTracking() {
        let x = GameObject.getScreenWidth() - 200
        let y = self.scene.getPlayer().node.position.y
        
        self.node.position = CGPoint(x: x, y: y)
    }
    
    func getSize() -> CGSize {
        return CGSize(width: 60, height: 60 )
    }
    
    override func getNodeName() -> String {
        return "enemyMissle"
    }
    
    override func getHorizontalSpeed() -> CGFloat {
        return 2 * super.getHorizontalSpeed()
    }
}
