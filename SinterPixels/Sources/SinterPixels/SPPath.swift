//
//  SPPath.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/12/26.
//

import Foundation

public extension FourCharCode {
    static var classPath: FourCharCode { return FourCharCode(string: "Path")  }
    static var pAnchorData: FourCharCode { return FourCharCode(string: "PAkD")  }
}

public class SPPath: SPObject {
    static public var fcc: FourCharCode { .classPath }
}
