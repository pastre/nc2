//
//  Enemy.swift
//  NC2
//
//  Created by Bruno Pastre on 04/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class Enemy: GameObject {
    
    var hasSpawned: Bool! = false
    var isDead: Bool = false
    
    
    override init(_ node: SKSpriteNode, scene: GameScene) {
        super.init(node, scene: scene)
        
        let body = self.getPhysicsBody()
        
        self.configureEnemyPhysics(body)
        self.configureEnemyTextures()
        
    }
    
    func configureEnemyPhysics(_ body: SKPhysicsBody) {
        
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
    
    
    func configureEnemyTextures() {
        // Metodo abstrato chamado no init para configurar as texturas
    }
    
    func getPhysicsBody() -> SKPhysicsBody {
        fatalError("\(self) did not implement getPhysicsBody")
    }
    
    override func getNodeName() -> String {
        return "enemy"
    }
    
    func getHorizontalSpeed() -> CGFloat {
        return SpeedManager.instance.getCurrentSpeed() 
    }
    
    func prepareForSpawn() {
        
    }
}
