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
        let body = SKPhysicsBody(circleOfRadius: 20)
        
//        body.affectedByGravity = true
//        body.mass = 10000
        
        self.speed = super.speed * 2
        self.gravity = .random(in: 50...100)
        
        return body
        
    }
    
    override func update(_ deltaTime: TimeInterval) {
        super.update(deltaTime)
        
        let dY = CGFloat(deltaTime) * self.gravity
        
        self.node.position.y -= dY
    }
    
    
    
    override func configureEnemyTextures() {
        let sphere = SKShapeNode(circleOfRadius: 20)
        
        sphere.fillColor = .magenta
        
        self.node.addChild(sphere)
    }
    
}
