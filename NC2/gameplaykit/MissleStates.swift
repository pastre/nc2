//
//  MissleStates.swift
//  NC2
//
//  Created by Bruno Pastre on 05/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import GameplayKit

class MissleTracking: GKState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == MissleShooting.self
    }
}

class MissleShooting: GKState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == MissleTracking.self
    }
}
