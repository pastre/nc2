//
//  MissleEnemyManager.swift
//  NC2
//
//  Created by Bruno Pastre on 05/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class MissleEnemyManager: EnemyManager {
    
    override func getEnemyNode() -> SKSpriteNode {
        let newEnemyNode = SKSpriteNode()
        
        newEnemyNode.position = CGPoint(x: self.getScreenWidth(), y: 0)
        
        return newEnemyNode
    }
    
    override func getEnemy(using node: SKSpriteNode) -> Enemy {
        return MissleEnemy(node, scene: self.scene)
    }
    
}
