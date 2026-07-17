//
//  ObjectSpecifier.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/12/26.
//

import Foundation

public class ObjectSpecifier {

    let container: NSAppleEventDescriptor
    let classWanted: FourCharCode
    let keyform: FourCharCode
    let keydata: NSAppleEventDescriptor
 
    public init(_ classWanted: FourCharCode, container: NSAppleEventDescriptor?, keyform: FourCharCode, keydata: NSAppleEventDescriptor) {
        self.container = container ?? NSAppleEventDescriptor.null()
        self.classWanted = classWanted
        self.keyform = keyform
        self.keydata = keydata
    }
    
    public func every(_ whatClass: FourCharCode) -> ObjectSpecifier {
        return self.asNSAppleEventDescriptor().every(whatClass);
    }
 
    public func asNSAppleEventDescriptor() -> NSAppleEventDescriptor {
        let recordDescriptor = NSAppleEventDescriptor.record()
 
        recordDescriptor.setParam(container, forKeyword: AEKeyword(keyAEContainer))
        recordDescriptor.setParam(NSAppleEventDescriptor(enumCode: keyform), forKeyword: AEKeyword(keyAEKeyForm))
        recordDescriptor.setParam(NSAppleEventDescriptor(typeCode: classWanted), forKeyword: AEKeyword(keyAEDesiredClass))
        recordDescriptor.setParam(keydata, forKeyword: AEKeyword(keyAEKeyData))
        let objSpec = recordDescriptor.coerce(toDescriptorType: typeObjectSpecifier)
        return  objSpec ?? NSAppleEventDescriptor.null()
    }
 

    
}
