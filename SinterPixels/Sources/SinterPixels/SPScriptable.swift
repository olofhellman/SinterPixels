//
//  SPScriptable.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/13/26.
//


import Foundation

public class SPScriptable {
    
    let objSpec: NSAppleEventDescriptor
    public init(_ objSpec: NSAppleEventDescriptor) {
        self.objSpec = objSpec
    }
    
    
    public func getData() -> NSAppleEventDescriptor {
        guard let app = SPApp.shared else {
            return NSAppleEventDescriptor.null()
        }
        return app.getData(directObject: self.objSpec)
    }
    
    public func setData(newValue: NSAppleEventDescriptor) {
        guard let app = SPApp.shared else {
            return
        }
        return app.setData(directObject: self.objSpec, newValue: newValue)

    }

}
