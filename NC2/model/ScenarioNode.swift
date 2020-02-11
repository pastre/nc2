//
//  ScenarioNode.swift
//  NC2
//
//  Created by Bruno Pastre on 11/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class ScenarioNode: SKNode {
    
    var currentNode: SKSpriteNode!
    var nextNode: SKSpriteNode!
    
    let velocity: CGFloat = 100
    
    init(imageSource src: String) {
        super.init()
        
        self.currentNode = SKSpriteNode(imageNamed: src)
        self.nextNode = self.currentNode.copy() as! SKSpriteNode
        
        self.commonInit()
    }

    init(reference node: SKSpriteNode ){
        super.init()
        
        if node.parent != nil { node.removeFromParent() }
        
        self.currentNode = node
        self.nextNode = node.copy() as! SKSpriteNode
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    func commonInit() {
        
        self.addChild(self.currentNode)
        self.addChild(self.nextNode)
        
        self.nextNode.position.x += self.getImageWidth()
    }
    
    func getImageWidth() -> CGFloat {
        let width = self.currentNode.texture!.cgImage().width
        
        return CGFloat(width)
    }
    
    func update(_ timeDelta: TimeInterval) {
        let dX = CGFloat(timeDelta) * self.velocity
        
        if currentNode.position.x < -self.getImageWidth() {
            let pivot = self.currentNode

            self.currentNode = self.nextNode

            pivot!.position.x = self.getImageWidth()
            
            self.nextNode = pivot
        }
               
       self.currentNode.position.x -= dX
       self.nextNode.position.x -= dX
           
    }

}
