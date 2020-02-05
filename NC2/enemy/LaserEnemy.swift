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
    
    init(_ node: SKSpriteNode, size: CGSize =  CGSize(width: 20, height: CGFloat.random(in: 50...80))){
        self.size = size
        
        super.init(node)
        
        self.node.zRotation = self.getZRotation()
    }
    
    override func configureEnemyTextures() {
        
        let sphereRadius = self.size.width / 2
        let connectorHeight = self.size.height - (2 * sphereRadius)
        
        let topSphere = SKShapeNode(circleOfRadius: sphereRadius)
        let bottomSphere = SKShapeNode(circleOfRadius: sphereRadius)
        let connector = SKShapeNode(rectOf: CGSize(width: self.size.width / 4, height: connectorHeight))
        
        topSphere.fillColor = .red
        bottomSphere.fillColor = .red
        connector.fillColor = .orange
        
        self.node.addChild(topSphere)
        self.node.addChild(bottomSphere)
        self.node.addChild(connector)
        
        topSphere.position = CGPoint(x: 0, y: (self.size.height / 2) - sphereRadius)
        bottomSphere.position = CGPoint(x: 0 / 2, y: -(self.size.height / 2) + sphereRadius)
        
        connector.position = CGPoint.zero
        
    }
    
    override func getPhysicsBody() -> SKPhysicsBody {
        
        return SKPhysicsBody(rectangleOf: self.size)
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
