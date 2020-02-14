//
//  ContactMask.swift
//  NC2
//
//  Created by Bruno Pastre on 13/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

enum ContactMask: UInt32 {
    case player = 0b1
    case enemy = 0b10
    case coin = 0b100
    case ground = 0b10000
    
    case none = 0b00000000000000000000000000000000
}
