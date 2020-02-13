//
//  Enemy.swift
//  NC2
//
//  Created by Bruno Pastre on 04/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class Enemy: Interactable {
    
    var hasSpawned: Bool! = false
    var isDead: Bool = false
    
    override func configurePhysics(_ body: SKPhysicsBody) {
        
        body.affectedByGravity = false
        body.allowsRotation = false
        body.pinned = false
        
        body.isDynamic = false
        body.categoryBitMask = ContactMask.enemy.rawValue
        body.collisionBitMask = 0
        body.contactTestBitMask = ContactMask.player.rawValue
        
        node.physicsBody = body

    }
    
    override func update(_ deltaTime: TimeInterval) {
        let displacement = CGFloat(deltaTime) * self.getHorizontalSpeed()
        
        node.position.x -= displacement
        
    }
    
    
    override func getNodeName() -> String {
        return "enemy"
    }
    
    func prepareForSpawn() {
        
    }
}
