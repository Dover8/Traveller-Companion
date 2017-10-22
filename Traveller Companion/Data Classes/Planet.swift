//
//  Planet.swift
//  Traveller Companion
//
//  Created by Ben MacKinnon on 19/10/2017.
//  Copyright © 2017 Ben MacKinnon. All rights reserved.
//

import Foundation

enum TradeCode {
    case Ag //Agricultural
    case As //Asteroid
    case Ba //Barren
    case De //Desert
    case Fl //Fluid Ocean
    case Ga //Garden
    case Hi //High Population
    case Ht //High Tech
    case IC //Ice Capped
    case In //Industrial
    case Lo //Low Population
    case Lt //Low Tech
    case Na //Non-Agricultural
    case NI //Non-Industrial
    case Po //Poor
    case Ri //Rich
    case Va //Vacume
    case Wa //Water world
};

class Planet  {
    
    var Starport: UInt8; // Range = 0 - 12. Value is NOT hexidecimal
    var Size: UInt8; //Range = 0 - 10
    var Atmosphere: UInt8; // Range = 0 - 15(F)
    var Hydrophonics: UInt8; // Range = 0 (desert) - 10 (entirely water)
    var Population: UInt8; // Range = 0 - 12(C) (10 ^ value represents Population)
    var Government: UInt8; // Range = 0 - 13(D)
    var Law: UInt8; // Range = 0 - 9+ (No upper limit as Government level is added to the roll in generation).
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
    
    func CalculateTradeCodes() -> [TradeCode] {
        var codes: [TradeCode] = []
        //example
        codes.append(TradeCode.Ag)
        
        return codes
    }
    
}
