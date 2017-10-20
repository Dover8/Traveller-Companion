//
//  Planet.swift
//  Traveller Companion
//
//  Created by Ben MacKinnon on 19/10/2017.
//  Copyright © 2017 Ben MacKinnon. All rights reserved.
//

import Foundation


class Planet  {
    
    var Starport: UInt8;
    var Size: UInt8;
    var Atmosphere: UInt8;
    var Hydrophonics: UInt8;
    var Population: UInt8;
    var Government: UInt8;
    var Law: UInt8;
    var Tech: UInt8;
    
    init?(uwp: String) {
        if uwp.validateUWP() {
            Starport = uwp.HexToInt(index: 0)
            Size = uwp.HexToInt(index: 1)
            Atmosphere = uwp.HexToInt(index: 2)
            Hydrophonics = uwp.HexToInt(index: 3)
            Population = uwp.HexToInt(index: 4)
            Government = uwp.HexToInt(index: 5)
            Law = uwp.HexToInt(index: 6)
            Tech = uwp.HexToInt(index: 8)
        }
        else
        {
            print("Error parsing UWP")
            return nil
        }
    }
    
}
