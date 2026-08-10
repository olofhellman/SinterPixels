//
//  SPShape.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/12/26.
//


import Foundation
import SinterAppleEvents

public extension FourCharCode {
    static var classShape: FourCharCode { return FourCharCode(string: "Shpe")  }
    static var pColor: FourCharCode { return FourCharCode(string: "colr")  }
    static var pFillColor: FourCharCode { return FourCharCode(string: "flcl")  }
    static var pLineWidth: FourCharCode { return FourCharCode(string: "LWth")  }
    static var pPosition: FourCharCode { return FourCharCode(string: "ppos")  }
    static var pBlendMode: FourCharCode { return FourCharCode(string: "Blnd")  }
}


public class SPShape: SAEObject {
    static public var fcc: FourCharCode { .classShape }

}

 
