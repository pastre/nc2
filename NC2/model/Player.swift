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
    var walkedDistance: CGFloat = 0
    
    let walkingSpeed = 100
    
    let stateMachine: GKStateMachine! = GKStateMachine(states: [PlayerRunning(), PlayerFlying(), PlayerFalling()])
    
    override init(_ node: SKSpriteNode, scene: GameScene) {
        super.init(node, scene: scene)
        
        self.stateMachine.enter(PlayerRunning.self)
    }
    
    func changeJetpack(isOn: Bool) {
        self.isJetpackOn = isOn
    }
    
    override func update(_ deltaTime: TimeInterval) {
        let body = self.node.physicsBody!
        
        self.walkedDistance += CGFloat(deltaTime) * CGFloat(self.walkingSpeed)
        
        if isJetpackOn {
            
//            if self.stateMachine.currentState is PlayerFalling {
//                body.velocity.dy = 0
//            }
            
            body.applyForce(CGVector(dx: 0, dy: 150))
            
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
