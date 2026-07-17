//
//  SPCircle.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/12/26.
//


import Foundation


public extension FourCharCode {
    static var classCircle: FourCharCode { return FourCharCode(string: "Circ")  }
}

public class SPCircle: SPObject {
    static public var fcc: FourCharCode { .classCircle }
}
