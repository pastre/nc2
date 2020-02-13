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
    var scene: GameScene
    
    init(_ node: SKSpriteNode, scene: GameScene) {
        self.node = node
        
        self.scene = scene
        self.node.name = self.getNodeName()
    }

    
    func update(_ deltaTime: TimeInterval) {
        
    }
    
    func getNodeName() -> String {
        fatalError("\(self) did not implement getNodeName")
    }
    
    static func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width / 2
    }
    
    
    static func getScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.height / 2
    }
    
}

