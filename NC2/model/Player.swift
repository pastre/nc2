//
//  Player.swift
//  NC2
//
//  Created by Bruno Pastre on 04/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit


class Player: GameObject {
    
    var isJetpackOn = false
    
    func changeJetpack(isOn: Bool) {
        self.isJetpackOn = isOn
    }
    
    override func update(_ deltaTime: TimeInterval) {
        if isJetpackOn {
            let body = self.node.physicsBody!
                   
            body.applyForce(CGVector(dx: 0, dy: 100))
        }
    }
    
    override func getNodeName() -> String {
        return "player"
    }
}
