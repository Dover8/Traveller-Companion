//
//  UWPUtils.swift
//  Traveller Companion
//
//  Created by Ben MacKinnon on 20/10/2017.
//  Copyright © 2017 Ben MacKinnon. All rights reserved.
//

import Foundation

extension String {
    
    var length: Int {
        get {
            return self.characters.count;
        }
    }
    
        
    subscript (r: CountableClosedRange<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
        let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return String(self[startIndex...endIndex])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let startIndex =  self.index(self.startIndex, offsetBy: bounds.lowerBound)
        let endIndex = self.index(startIndex, offsetBy: bounds.upperBound - bounds.lowerBound)
        return String(self[startIndex..<endIndex])
    }
    
    subscript (i: Int) -> Character
    {
        get {
            let index = self.index(self.startIndex, offsetBy: i)
            return self[index]
        }
        
    }
    
    func matches(for regex: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func HexToInt(index: Int) -> UInt8 {
        let value = UInt8(String(self[index]), radix: 16)
        return value!
    }
    
    
    func validateUWP() -> Bool {
        //validate the length
        if self.length != 9 {
            return false
        }
        
        //validate the dash in the 7th position
        if self[7] != "-" {
            return false
        }
        
        //validate the hexadecimal component
        let regex = "^[a-fA-F0-9]{7}+[-]+[a-fA-F0-9]+$"
        let match = self.matches(for: regex)
        if match.count == 0 {
            return false
        }
        
        //further validation required?
        //maybe first character for spaceport (could be build into above regex)
        
        return true
    }
}

extension Character {
    
    func HexToInt() -> UInt8 {
        if let value = UInt8(String(self), radix: 16)
        {
            return value
        }
    }
    
}
