//
//  SPApp.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/12/26.
//

import Foundation
import ScriptingBridge

public extension FourCharCode {
    static var classApplication: FourCharCode { return FourCharCode(string: "capp")  }
    static var createElement: FourCharCode { return FourCharCode(string: "crel")  }
}

public class SPApp : SPObject {
    nonisolated(unsafe) static let shared: SPApp? = SPApp()
    let bridgeApp: SBApplication
    let spBundleIdentifier = "com.tomographic.sinterpixels"
    let appObjectSpecifier: AppObjectSpecifier

    public init?() {
        guard let app = SBApplication(bundleIdentifier: spBundleIdentifier) else {
            return nil
        }
        bridgeApp = app
        let appOS = AppObjectSpecifier()
        self.appObjectSpecifier = appOS
        super.init(appOS.asNSAppleEventDescriptor())
    }
    
    public func activate() {
        bridgeApp.activate()
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
    
    override public func elements(ofClass classFcc: FourCharCode) -> [NSAppleEventDescriptor] {
        let event = appObjectSpecifier.coreEvent(eventID: FourCharCode.getData)
        
        let directObjectSpecifier = appObjectSpecifier.every(classFcc)
        event.setParam(directObjectSpecifier.asNSAppleEventDescriptor(), forKeyword: AEKeyword(keyDirectObject))
        
        guard let reply = try? event.sendEvent(options: [], timeout: 10) else {
            return []
        }
        guard let result = reply.paramDescriptor(forKeyword: AEKeyword(keyAEResult)) else {
            return []
        }
        
        if result.descriptorType == typeAEList {
            var listOfAEDesc: [NSAppleEventDescriptor] = []
            let ct = result.numberOfItems
            for i in 1...ct {
                if let nthItem = result.atIndex(i) {
                    listOfAEDesc.append(nthItem)
                }
            }
            return listOfAEDesc
        }
        return []
    }
    
    public func documents() -> [SPDocument] {
        let docs = elements(ofClass: SPDocument.fcc)
        return docs.map { SPDocument($0) }
    }
        
    public func document(atASIndex asIndex: Int) -> SPDocument? {
        guard let doc = element(ofClass: FourCharCode.classDocument, atASIndex: asIndex) else {
            return nil
        }
        return SPDocument(doc)
    }

    public func make(new whatClass: FourCharCode, container: NSAppleEventDescriptor, props: NSAppleEventDescriptor? = nil) -> NSAppleEventDescriptor? {
        let event = self.coreEvent(eventID: FourCharCode.createElement)
        let insertLoc = SPInsertionLocation(obj: container, pos: kAEEnd)
        event.setParam(NSAppleEventDescriptor(typeCode: whatClass), forKeyword: AEKeyword(keyAEObjectClass))
        event.setParam(insertLoc.asNSAppleEventDescriptor(), forKeyword: AEKeyword(keyAEInsertHere) )
        if let props {
            event.setParam(props, forKeyword: AEKeyword(keyAEPropData) )
        }
        
        let result = try? event.sendEvent(options: .waitForReply, timeout: 60)
        return result?.paramDescriptor(forKeyword: AEKeyword(keyAEResult))
    }
    
    
    public func getData(directObject: NSAppleEventDescriptor) -> NSAppleEventDescriptor {
        let event = self.coreEvent(eventID: FourCharCode.getData)
        event.setParam(directObject, forKeyword: AEKeyword(keyDirectObject))
        
        let result = try? event.sendEvent(options: .waitForReply, timeout: 60)
        return result?.paramDescriptor(forKeyword: AEKeyword(keyAEResult)) ?? NSAppleEventDescriptor.null()
    }
    
    public func setData(directObject: NSAppleEventDescriptor, newValue: NSAppleEventDescriptor) {
        let event = self.coreEvent(eventID: FourCharCode.setData)
        event.setParam(directObject, forKeyword: AEKeyword(keyDirectObject))
        event.setParam(newValue, forKeyword: AEKeyword(keyAEData))
        _ = try? event.sendEvent(options: .waitForReply, timeout: 60)
 
    }


}
