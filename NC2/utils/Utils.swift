//
//  Utils.swift
//  NC2
//
//  Created by Bruno Pastre on 13/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

func loadParticle(named: String) -> SKEmitterNode? {
    guard let path = Bundle.main.path(forResource: named, ofType: "sks") else { return nil }
    
    return NSKeyedUnarchiver.unarchiveObject(withFile: path) as? SKEmitterNode
}
