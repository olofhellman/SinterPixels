//
//  SPAnchorData.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/12/26.
//


import Foundation


public extension FourCharCode {
    static var pTangent: FourCharCode { return FourCharCode(string: "Tang")  }
}
 
public struct SPAnchorData {
    let tangent: Double
    let position: SPPosition
    
    public init(tangent: Double, position: SPPosition) {
        self.position = position
        self.tangent = tangent
    }
    
    public func asNSAppleEventDescriptor() -> NSAppleEventDescriptor {
        let record = NSAppleEventDescriptor.record()
        record.setParam(NSAppleEventDescriptor(double: self.tangent), forKeyword: FourCharCode.pTangent)
        record.setParam( self.position.asNSAppleEventDescriptor(), forKeyword: FourCharCode.pPosition)
        return record
    }
}
