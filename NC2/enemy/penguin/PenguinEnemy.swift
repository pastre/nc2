//
//  PenguinEnemy.swift
//  NC2
//
//  Created by Bruno Pastre on 05/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit


class PenguinEnemy: Enemy {
    
    var gravity: CGFloat = 50
    
    override func getPhysicsBody() -> SKPhysicsBody {
        let texture = SKTexture(imageNamed: "penguin")
        
        let body = SKPhysicsBody(texture: texture, alphaThreshold: 0.9, size: self.getSize())
        
        
        
        self.gravity = .random(in: 50...100)
        
        return body
        
    }
    
    override func update(_ deltaTime: TimeInterval) {
        super.update(deltaTime)
        
        let dY = CGFloat(deltaTime) * self.gravity
        
        self.node.position.y -= dY
    }
    
    
    
    override func configureEnemyTextures() {
        let sphere = SKSpriteNode(imageNamed: "penguin")
        
        sphere.scale(to: self.getSize())
        sphere.zPosition = ZPositionManager.PENGUIN.rawValue
        
        self.node.addChild(sphere)
    }
    
    func getSize() -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    
    override func getHorizontalSpeed() -> CGFloat {
        return 2 * super.getHorizontalSpeed()
    }
    
}
