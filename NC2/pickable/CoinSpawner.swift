//
//  CoinSpawner.swift
//  NC2
//
//  Created by Bruno Pastre on 14/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class CoinSpawner: Interactable{
    
    
    var coinStructures: [SKNode] = []
    
    func spawnCoinStructure(on node: SKNode) {
        let structure = CoinFactory.getCoinPattern()
        
        node.addChild(structure)
        
        self.coinStructures.append(structure)
    }
    
    override func update(_ deltaTime: TimeInterval) {
        
        self.coinStructures.forEach { structure in

            structure.position.x -= self.getHorizontalSpeed() * CGFloat(deltaTime)
        }
    }
    
    func onGameOver() {
        self.coinStructures.forEach { structure in
            structure.removeFromParent()
        }
        
        self.coinStructures.removeAll()
    }
    
    
    override func getPhysicsBody() -> SKPhysicsBody {
        return .init(circleOfRadius: 0)
    }
}
