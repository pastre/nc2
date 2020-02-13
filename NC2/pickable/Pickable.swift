//
//  Pickable.swift
//  NC2
//
//  Created by Bruno Pastre on 13/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class Pickable: GameObject {
    
    override init(_ node: SKSpriteNode, scene: GameScene) {
        super.init(node, scene: scene)
        
        let body = self.getPhysicsBody()
        
        self.configurePickablePhysics(body)
        self.configurePickableTexture()
    }
    
    func configurePickablePhysics(_ body: SKPhysicsBody) {
        
    }
    
    func configurePickableTexture() {
        
    }
    
    func getPhysicsBody() -> SKPhysicsBody {
        fatalError("\(self) did not implement getPhysicsBody")
    }
    
}
