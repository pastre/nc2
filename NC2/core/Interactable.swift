//
//  Interactable.swift
//  NC2
//
//  Created by Bruno Pastre on 13/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class Interactable: GameObject {
    
    override init(_ node: SKSpriteNode, scene: GameScene) {
        super.init(node, scene: scene)
        
        let body = self.getPhysicsBody()
        
        self.configurePhysics(body)
        self.configureTextures()
        
    }
    
    
    func configurePhysics(_ body: SKPhysicsBody) {
        // Metodo abstrato chamado no init para configurar a fisica
        
    }
    
    
    func configureTextures() {
        // Metodo abstrato chamado no init para configurar as texturas
    }
    
    func getPhysicsBody() -> SKPhysicsBody {
        fatalError("\(self) did not implement getPhysicsBody")
    }
    
    func getHorizontalSpeed() -> CGFloat {
        return SpeedManager.instance.getCurrentSpeed()
    }
    
    override func getNodeName() -> String {
        return "interactable"
    }
}
