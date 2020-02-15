//
//  CoinFactory.swift
//  NC2
//
//  Created by Bruno Pastre on 14/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class CoinFactory{
    
    static var coinTemplate: SKSpriteNode!
    
    static var loadedPatterns: [SKNode]! = []
    
    static func loadScene(named name: String ) -> SKNode? {
        
        guard let scene = SKScene(fileNamed: name) else { return nil }
        
        let node = scene.childNode(withName: "group")
        node?.removeFromParent()
        node?.children.forEach({ (node) in
            node.name = "coin"
            print("node",  node)
            if let node = node as? SKSpriteNode {
                print("Configured!")
                node.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "coin1"), alphaThreshold: 0.9, size: node.size)
            }
        })
        
        return node
        
    }
    
    static func loadPatters(_ scene: SKScene) {
        /*let sceneNames = ["group"]
        
        for name in sceneNames {
            if let node = self.loadScene(named: name) {
                self.loadedPatterns.append(node)
            }
        }*/
        guard let node = scene.childNode(withName: "group") else { return }
        node.children.forEach({ (node) in
            node.name = "coin"
            
            if let node = node as? SKSpriteNode {
                
                let body = SKPhysicsBody(circleOfRadius: 10)
                body.affectedByGravity = false
                body.allowsRotation = false
                body.pinned = false
                
                body.isDynamic = false
                body.categoryBitMask = ContactMask.coin.rawValue
                body.collisionBitMask = 0
                body.contactTestBitMask = ContactMask.player.rawValue
                
                node.physicsBody = body
                print("Configured")
            }
        })
        self.loadedPatterns.append(node)
    }
    
    static func getCoinPattern() -> SKNode  {
        return self.loadedPatterns.randomElement()!.copy() as! SKNode 
    }
}
