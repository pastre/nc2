//
//  GameObject.swift
//  NC2
//
//  Created by Bruno Pastre on 04/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit


class GameObject {
    
    var node: SKSpriteNode!
    
    init(_ node: SKSpriteNode) {
        self.node = node
        
        self.node.name = self.getNodeName()
    }
    
    func update(_ deltaTime: TimeInterval) {
        
    }
    
    func getNodeName() -> String {
        fatalError("\(self) did not implement getNodeName")
    }
    
}

