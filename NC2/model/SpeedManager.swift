//
//  SpeedManager.swift
//  NC2
//
//  Created by Bruno Pastre on 08/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class SpeedManager {
    static let instance = SpeedManager()
    
    private var currentSpeed: CGFloat!
    private var player: Player!
    
    private init() {
        self.currentSpeed = 100
    }
    
    func getCurrentSpeed() -> CGFloat {
        return self.currentSpeed //1 + self.currentSpeed * (self.player.walkedDistance / 100)
    }
    
    func setPlayer(to player: Player) {
        self.player = player
    }
}
