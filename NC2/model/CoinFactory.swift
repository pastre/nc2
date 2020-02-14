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
        
//        node?.children.forEach({ (child) in
//            if let sprite = child as? SKSpriteNode {
//                let sprites = sprite.value(forKey: "actions") as? NSArray
//                print("------", sprites?.firstObject)
//            }
//        })
        
        return node
        
    }
    
    static func loadPatters(_ scene: SKScene) {
        /*let sceneNames = ["group"]
        
        for name in sceneNames {
            if let node = self.loadScene(named: name) {
                self.loadedPatterns.append(node)
            }
        }*/
        let node = scene.childNode(withName: "group")!
        self.loadedPatterns.append(node)
    }
    
    static func getCoinPattern() -> SKNode  {
        return self.loadedPatterns.randomElement()!.copy() as! SKNode 
    }
}
