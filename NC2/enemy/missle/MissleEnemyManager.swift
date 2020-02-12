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
        
        newEnemyNode.position = CGPoint(x: GameObject.getScreenWidth(), y: 0)
        
        return newEnemyNode
    }
    
    override func getEnemy(using node: SKSpriteNode) -> Enemy {
        return MissleEnemy(node, scene: self.scene)
    }
    
    override func deactivateEnemy(_ enemy: Enemy) {
        super.deactivateEnemy(enemy)
        
        enemy.prepareForSpawn()
    }
    
    
    
    override func prepareForSpawn(_ enemy: Enemy) {
        guard let enemy = enemy as? MissleEnemy else { return }
        
        enemy.node.zPosition = ZPositionManager.MISSLE.rawValue
        enemy.stateMachine.enter(MissleTracking.self)
    }
}
