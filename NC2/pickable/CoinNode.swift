//
//  CoinNode.swift
//  NC2
//
//  Created by Bruno Pastre on 14/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class Coin: Pickable {
    
    
    override func configureTextures() {
        let texture = SKSpriteNode()
        
        texture.color = .green
        
        self.node.addChild(texture)
    }
    
    override func getPhysicsBody() -> SKPhysicsBody {
        return SKPhysicsBody(circleOfRadius: 20)
    }
    
    
    
}
