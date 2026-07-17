//
//  SPObjectProperty.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/13/26.
//


import Foundation

public class SPObjectProperty: SPScriptable {
    let spObject: SPObject
    let propCode: FourCharCode
    
    init(spObject: SPObject, propCode: FourCharCode) {
        self.spObject = spObject
        self.propCode = propCode
        let propSpec = spObject.objSpec.property(propCode)
        super.init(propSpec.asNSAppleEventDescriptor())
    }
}
    
 
