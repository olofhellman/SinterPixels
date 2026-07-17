//
//  AppObjectSpecifier.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/12/26.
//

import Foundation

public class AppObjectSpecifier: ObjectSpecifier {
    let spBundleIdentifier = "com.tomographic.sinterpixels"
    nonisolated(unsafe) static let sharedApp = AppObjectSpecifier()
    
    init() {
        super.init(FourCharCode.classApplication, container: nil, keyform: FourCharCode.formUniqueID, keydata: NSAppleEventDescriptor.null())
    }
    
    override public func asNSAppleEventDescriptor() -> NSAppleEventDescriptor {
        return NSAppleEventDescriptor.null()
    }
    
    public func coreEvent(eventID: FourCharCode) -> NSAppleEventDescriptor {
        let target = NSAppleEventDescriptor(bundleIdentifier: spBundleIdentifier)
        let event = NSAppleEventDescriptor(
            eventClass: AEEventClass(FourCharCode(string: "core")),
            eventID: AEEventID(eventID),
            targetDescriptor: target,
            returnID: AEReturnID(kAutoGenerateReturnID),
            transactionID: AETransactionID(kAnyTransactionID)
        )
        return event
    }

}
