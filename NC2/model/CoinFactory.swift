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
        
        return node
        
    }
    
    static func loadPatters() {
        let sceneNames = ["Coin"]
        
        for name in sceneNames {
            if let node = self.loadScene(named: name) {
                self.loadedPatterns.append(node)
            }
        }
    }
    
    static func getCoinPattern() -> SKNode  {
        return self.loadedPatterns.randomElement()!.copy() as! SKNode 
    }
}
