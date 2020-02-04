//
//  JetpackOn.swift
//  NC2
//
//  Created by Bruno Pastre on 04/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import GameplayKit

class PlayerRunning: GKState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == PlayerFlying.self
    }
}

class PlayerFlying: GKState {

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == PlayerFalling.self || stateClass == PlayerRunning.self
    }
}

class PlayerFalling: GKState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == PlayerFlying.self || stateClass == PlayerRunning.self
    }
}


