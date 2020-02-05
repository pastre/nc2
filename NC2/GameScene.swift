//
//  GameScene.swift
//  NC2
//
//  Created by Bruno Pastre on 04/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player: Player!
    var lastUpdate = TimeInterval()
    var jetpackIsOn = false
    
    var enemiesManager: EnemyManager!
    
    var gameObjects = [GameObject]()
    
    override func didMove(to view: SKView) {
        
        let ground = self.childNode(withName: "ground")!
        let ceiling = self.childNode(withName: "ceiling")!
        let playerNode = childNode(withName: "player") as! SKSpriteNode
        let enemyNode = SKSpriteNode()
        
        self.player = Player(playerNode)
        self.enemiesManager = EnemyManager(enemyNode)
    
        
        ground.physicsBody?.categoryBitMask = ContactMask.ground.rawValue
        ground.physicsBody?.collisionBitMask = ContactMask.player.rawValue
        ground.physicsBody?.contactTestBitMask = ContactMask.none.rawValue
        
        ceiling.physicsBody?.categoryBitMask = ContactMask.ground.rawValue
        ceiling.physicsBody?.collisionBitMask = ContactMask.player.rawValue
        ceiling.physicsBody?.contactTestBitMask = ContactMask.none.rawValue
        
        playerNode.physicsBody?.categoryBitMask = ContactMask.player.rawValue
        playerNode.physicsBody?.collisionBitMask = ContactMask.ground.rawValue
        playerNode.physicsBody?.contactTestBitMask = ContactMask.enemy.rawValue
        playerNode.physicsBody?.restitution = 0
        
        self.addChild(enemyNode)
        
        self.gameObjects.append(player)
        self.gameObjects.append(enemiesManager)
        
        self.physicsWorld.contactDelegate = self
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        player.changeJetpack(isOn: true)
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        player.changeJetpack(isOn: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
       
        if lastUpdate == 0 {
            lastUpdate = currentTime
            return
        }
        let deltaTime = currentTime - self.lastUpdate
        
        self.gameObjects.forEach { $0.update(deltaTime) }
        
        self.lastUpdate = currentTime
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA.name == "player" {
            self.playerCollision(playerNode: nodeA, other: nodeB)
        } else if nodeB.name == "player" {
            self.playerCollision(playerNode: nodeB, other: nodeA)
        }
        
        
    }
    
    func playerCollision(playerNode: SKNode, other: SKNode) {
        print(playerNode.name, other.name)
    }
}
