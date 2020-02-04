//
//  Player.swift
//  NC2
//
//  Created by Bruno Pastre on 04/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit
import GameplayKit

class Player: GameObject {
    
    var isJetpackOn = false
    let stateMachine: GKStateMachine! = GKStateMachine(states: [PlayerRunning(), PlayerFlying(), PlayerFalling()])
    
    override init(_ node: SKSpriteNode) {
        super.init(node)
        
        self.stateMachine.enter(PlayerRunning.self)
    }
    
    func changeJetpack(isOn: Bool) {
        self.isJetpackOn = isOn
    }
    
    override func update(_ deltaTime: TimeInterval) {
        let body = self.node.physicsBody!
        if isJetpackOn {
            body.applyForce(CGVector(dx: 0, dy: 100))
            
        }

        self.updatePlayerState(body.velocity.dy)
    }
    
    func updatePlayerState(_ dy: CGFloat) {

        if dy == 0 {
            self.stateMachine.enter(PlayerRunning.self)
        } else if dy < 0 {
            self.stateMachine.enter(PlayerFalling.self)
        } else {
            self.stateMachine.enter(PlayerFlying.self)
        }
    }
    
    override func getNodeName() -> String {
        return "player"
    }
}
