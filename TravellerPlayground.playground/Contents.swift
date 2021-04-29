//: Playground - noun: a place where people can play

import UIKit

let UWP = "C775300-0"

extension String {

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
    
    func HexToInt(index: Int) -> UInt8 {
        let value = UInt8(String(self[index]), radix: 16)
        return value!
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
}
func matches(for regex: String, in text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}


func validateUWP(uwp: String) -> Bool {
    
    //validate the length
    if uwp.count != 9 {
        return false
    }
    
    //validate the dash in the 7th position
    if uwp[7] != "-" {
        return false
    }
    
    //validate the hexadecimal component
    let regex = "^[a-fA-F0-9]{7}+[-]+[a-fA-F0-9]+$"
    let match = matches(for: regex, in: uwp)
    if match.count == 0 {
        return false
    }
    
    //further validation required?
    //maybe first character for spaceport
    
    return true
}


validateUWP(uwp: UWP);

let string = "FF"
if let value = UInt8(string, radix: 16)
{
    print(value)
}

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
        if validateUWP(uwp: uwp) {
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

let planet = Planet.init(uwp: UWP)

let UWP2 = "C9A4899-0"
let planet2 = Planet.init(uwp: UWP2)
