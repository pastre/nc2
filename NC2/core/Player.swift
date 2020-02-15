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
    private var walkedDistance: CGFloat = 0
    
    let walkingSpeed = 100
    let maxVal: CGFloat = 225
    let minVal: CGFloat = -225
    
    var fireParticle: SKEmitterNode!
    private var currentCoin: Int = 0
    
    let stateMachine: GKStateMachine! = GKStateMachine(states: [PlayerRunning(), PlayerFlying(), PlayerFalling()])
    
    override init(_ node: SKSpriteNode, scene: GameScene) {
        super.init(node, scene: scene)
        
        self.stateMachine.enter(PlayerRunning.self)
        self.node.zPosition = ZPositionManager.PLAYER.rawValue
        
        guard let fire = loadParticle(named: "BatcarFire") else { return }
        
        self.node.addChild(fire)
        
        fire.setScale(5)
        fire.position = CGPoint(x: 0, y: -5 * self.node.texture!.size().height)
        fire.zPosition = ZPositionManager.PLAYER_FIRE.rawValue
        
        self.fireParticle = fire
    }
    
    
    func changeJetpack(isOn: Bool) {
        self.isJetpackOn = isOn
    }
    
    override func update(_ deltaTime: TimeInterval) {
        let body = self.node.physicsBody!
        
        self.walkedDistance += CGFloat(deltaTime) * SpeedManager.instance.getCurrentSpeed()
    
        if isJetpackOn {
            body.applyForce(CGVector(dx: 0, dy: 210))
        }
    
        let clamp: CGFloat = min(max(body.velocity.dy, self.minVal), self.maxVal)
        
        body.velocity.dy = clamp
    
        self.updatePlayerState(body.velocity.dy)
        self.updatePlayerFire()
    }
    
    func updatePlayerFire() {
        if (self.stateMachine.currentState is PlayerFlying) {
            self.addPlayerFire()
        } else {
            self.disablePlayerFire()
        }
    }
    
    func addPlayerFire() {
        if self.fireParticle.parent != nil { return }
        self.node.addChild(self.fireParticle)
    }
    
    func disablePlayerFire() {
        if self.fireParticle.parent == nil { return }
        
        self.fireParticle.resetSimulation()
        self.fireParticle.removeFromParent()
    }
    
    func getWalkingDistance() -> Int {
        return Int(self.walkedDistance / 50)
    }
    
    
    func updatePlayerState(_ dy: CGFloat) {

        if dy == 0 && self.node.position.y < 0  {
            self.stateMachine.enter(PlayerRunning.self)
        } else if dy < 0 {
            self.stateMachine.enter(PlayerFalling.self)
        } else {
            self.stateMachine.enter(PlayerFlying.self)
        }
    }
    
    func onCoinCollected() {
        self.currentCoin += 1
    }
    
    func getCoinCount() -> Int {
        return self.currentCoin
    }
    
    func reset() {
        self.walkedDistance = 0
        self.currentCoin = 0
    }
    
    override func getNodeName() -> String {
        return "player"
    }
}
