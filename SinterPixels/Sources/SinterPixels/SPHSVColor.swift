//
//  SPHSVColor.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/12/26.
//


import Foundation


public extension FourCharCode {
    static var pHue: FourCharCode { return FourCharCode(string: "Hue ")  }
    static var pSaturation: FourCharCode { return FourCharCode(string: "Satu")  }
    static var pBrightness: FourCharCode { return FourCharCode(string: "Brtn")  }
}
 
public struct SPHSBColor: SPColor {
    let h: Double
    let s: Double
    let b: Double
    let a: Double
    
    public init(h: Double, s: Double, b: Double, a: Double = 1.0) {
        self.h = h
        self.s = s
        self.b = b
        self.a = a
    }
    
    public func asNSAppleEventDescriptor() -> NSAppleEventDescriptor {
        let record = NSAppleEventDescriptor.record()
        record.setParam(NSAppleEventDescriptor(double: self.h), forKeyword: FourCharCode.pHue)
        record.setParam(NSAppleEventDescriptor(double: self.s), forKeyword: FourCharCode.pSaturation)
        record.setParam(NSAppleEventDescriptor(double: self.b), forKeyword: FourCharCode.pBrightness)
        record.setParam(NSAppleEventDescriptor(double: self.a), forKeyword: FourCharCode.pAlphaComponent)
        return record
    }
}
