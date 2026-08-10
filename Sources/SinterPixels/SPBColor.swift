//
//  SPBColor.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/12/26.
//

import Foundation
import SinterAppleEvents


public extension FourCharCode {
    static var pRedComponent: FourCharCode { return FourCharCode(string: "redC")  }
    static var pGreenComponent: FourCharCode { return FourCharCode(string: "grnC")  }
    static var pBlueComponent: FourCharCode { return FourCharCode(string: "bluC")  }
    static var pAlphaComponent: FourCharCode { return FourCharCode(string: "alfC")  }
}

public protocol SPColor {
    func asNSAppleEventDescriptor() -> NSAppleEventDescriptor
}

public struct SPBColor: SPColor {
    let r: Double
    let g: Double
    let b: Double
    let a: Double
    
    public init(r: Double, g: Double, b: Double, a: Double = 1.0) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
    
    public func asNSAppleEventDescriptor() -> NSAppleEventDescriptor {
        let record = NSAppleEventDescriptor.record()
        record.setParam(NSAppleEventDescriptor(double: self.r), forKeyword: FourCharCode.pRedComponent)
        record.setParam(NSAppleEventDescriptor(double: self.g), forKeyword: FourCharCode.pGreenComponent)
        record.setParam(NSAppleEventDescriptor(double: self.b), forKeyword: FourCharCode.pBlueComponent)
        record.setParam(NSAppleEventDescriptor(double: self.a), forKeyword: FourCharCode.pAlphaComponent)
        return record
    }
}
