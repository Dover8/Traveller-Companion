//
//  Planet.swift
//  Traveller Companion
//
//  Created by Ben MacKinnon on 19/10/2017.
//  Copyright © 2017 Ben MacKinnon. All rights reserved.
//

import Foundation

enum TradeCode {
    /// Agricultural
    case Ag
    /// Asteroid
    case As
    /// Barren
    case Ba
    /// Desert
    case De
    /// Fluid Ocean
    case Fl
    /// Garden
    case Ga
    /// High Population
    case Hi
    /// High Tech
    case Ht
    /// Ice Capped
    case IC
    /// Industrial
    case In
    /// Low Population
    case Lo
    /// Low Tech
    case Lt
    /// Non-Agricultural
    case Na
    /// Non-Industrial
    case NI
    /// Poor
    case Po
    /// Rich
    case Ri
    /// Vacume
    case Va
    /// Water world
    case Wa
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
        
        if ((4...9).contains(Atmosphere) && (4...8).contains(Hydrophonics) && (5...7).contains(Population))
        {
            codes.append(TradeCode.Ag)
        }
        
        if (Size == 0 && Atmosphere == 0 && Hydrophonics == 0)
        {
            codes.append(TradeCode.As)
        }
        
        if (Population == 0 && Government == 0 && Law == 0)
        {
            codes.append(TradeCode.Ba)
        }
        
        if (Atmosphere > 1 && Hydrophonics == 0)
        {
            codes.append(TradeCode.De)
        }
        
        if (Atmosphere > 9 && Hydrophonics > 0)
        {
            codes.append(TradeCode.Fl)
        }
        
        if (Size > 4 && (4...9).contains(Atmosphere) && (4...8).contains(Hydrophonics))
        {
            codes.append(TradeCode.Ga)
        }
        
        if (Population > 8)
        {
            codes.append(TradeCode.Hi)
        }
        
        if (Tech > 11)
        {
            codes.append(TradeCode.Ht)
        }
        
        if (Atmosphere < 2 && Hydrophonics > 0)
        {
            codes.append(TradeCode.IC)
        }
        
        if (Population > 8 && (Atmosphere < 3 || Atmosphere == 4 || Atmosphere == 7 || Atmosphere == 9))
        {
            codes.append(TradeCode.In)
        }
        
        if (Population < 4)
        {
            codes.append(TradeCode.Lo)
        }
        
        if (Tech < 6)
        {
            codes.append(TradeCode.Lt)
        }
        
        if (Atmosphere < 4 && Hydrophonics < 4 && Population > 5)
        {
            codes.append(TradeCode.Na)
        }
        
        if ((4...6).contains(Population))
        {
            codes.append(TradeCode.NI)
        }
        
        if (Hydrophonics < 4 && (2...5).contains(Atmosphere))
        {
            codes.append(TradeCode.Po)
        }
        
        if ((Atmosphere == 6 || Atmosphere == 8) && (6...8).contains(Population))
        {
            codes.append(TradeCode.Ri)
        }
        
        if (Atmosphere == 0)
        {
            codes.append(TradeCode.Va)
        }
        
        if (Hydrophonics == 10)
        {
            codes.append(TradeCode.Wa)
        }
        
        return codes
    }
    
}
