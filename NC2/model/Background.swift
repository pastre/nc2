//
//  Background.swift
//  NC2
//
//  Created by Bruno Pastre on 06/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class BackgroundManager {
    
    var currentNode: SKSpriteNode!
    var nextNode: SKSpriteNode!
    var rootNode: SKNode
    
    let speed: CGFloat = 100
    
    init(root rootNode: SKNode, background bgNode: SKSpriteNode) {
        self.rootNode = rootNode
        
        self.currentNode = bgNode
        self.nextNode = bgNode.copy() as! SKSpriteNode
        
        rootNode.addChild(self.currentNode)
        rootNode.addChild(self.nextNode)
        
        print("Width is", self.getImageWidth())
        nextNode.position.x += self.getImageWidth()
    }
    
    func getImageWidth() -> CGFloat {
        return self.currentNode.size.width
    }
    
    func update(_ deltaTime: TimeInterval) {
        let dX = CGFloat(deltaTime) * self.speed
        
        
        if currentNode.position.x < -self.getImageWidth() {
            let pivot = self.currentNode
            
            self.currentNode = self.nextNode
            
            pivot!.position.x = self.getImageWidth() + 2// GameObject.getScreenWidth()
            
            self.nextNode = pivot
        }
        
        self.currentNode.position.x -= dX
        self.nextNode.position.x -= dX
    }
}

