//
//  LaserEnemyManger.swift
//  NC2
//
//  Created by Bruno Pastre on 05/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class LaserEnemyManger: EnemyManager  {
    
    override func getEnemyNode() -> SKSpriteNode {
        let newEnemyNode = SKSpriteNode()
        
        newEnemyNode.position = CGPoint(x: self.getScreenWidth(), y: CGFloat.random(in: -self.getScreenHeight()...self.getScreenHeight()))
        
        return newEnemyNode
    }
    
    override func getEnemy(using node: SKSpriteNode) -> Enemy {
        return LaserEnemy(node)
    }
    
}
