//
//  File.swift
//  NC2
//
//  Created by Bruno Pastre on 05/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class LaserEnemy: Enemy {
    
    var size: CGSize!
    
    init(_ node: SKSpriteNode, scene: GameScene, size: CGSize =  CGSize(width: 20, height: CGFloat.random(in: 60...85))){
        self.size = size
        
        super.init(node, scene: scene)
        
        self.node.zRotation = self.getZRotation()
    }
    
    override func configureTextures() {
        
        let sphereRadius = self.size.width / 2
        
        let topSphere = SKSpriteNode(imageNamed: "moss")
        let bottomSphere = SKSpriteNode(imageNamed: "moss")
        let connector = SKSpriteNode(imageNamed: "moss_conector")
        
        connector.scale(to: self.getSize())
        
        self.node.addChild(topSphere)
        self.node.addChild(bottomSphere)
        self.node.addChild(connector)
        
        topSphere.zPosition = ZPositionManager.MOSS_BALL.rawValue
        bottomSphere.zPosition = ZPositionManager.MOSS_BALL.rawValue
        connector.zPosition = ZPositionManager.MOSS_CONECTOR.rawValue
        
        topSphere.position = CGPoint(x: 0, y: (self.size.height / 2) - sphereRadius)
        bottomSphere.position = CGPoint(x: 0 / 2, y: -(self.size.height / 2) + sphereRadius)
        
        connector.position = CGPoint.zero
        
    }
    
    override func getPhysicsBody() -> SKPhysicsBody {
        
        return SKPhysicsBody(rectangleOf: self.size)
    }
    
    func getSize() -> CGSize {
        let sphereRadius = self.size.width / 2
        let connectorHeight = self.size.height - (2 * sphereRadius)
        return CGSize(width: self.size.width / 2, height: connectorHeight)
    }
    
    func getZRotation() -> CGFloat {
        let random = Int.random(in: 0...100)
        
        if random < 25 {
            return .pi / 4
        }
        
        if random < 50 {
            return .pi / 2
        }
        
        if random < 75 {
            return CGFloat.pi / -4
        }
        
        return 0
    }
    
}
