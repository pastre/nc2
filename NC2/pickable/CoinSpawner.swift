//
//  CoinSpawner.swift
//  NC2
//
//  Created by Bruno Pastre on 14/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class CoinSpawner{
    
    func spawnCoinStructure(on node: SKNode) {
        let structure = CoinFactory.getCoinPattern()
        
        node.addChild(structure)
    }
    
}
