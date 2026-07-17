//
//  SPObject.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/12/26.
//


import Foundation

public class SPObject: SPScriptable {
    
    public func element(ofClass classFcc: FourCharCode, atASIndex idx: Int) -> NSAppleEventDescriptor? {
        let elements = self.elements(ofClass: classFcc)
        let eCount = elements.count
        let index = ( idx < 0) ? eCount + 1 + idx : idx
        guard (index > 0) && (index <= eCount) else {
            return nil
        }
        return elements[index - 1]
    }
    
    public func elements(ofClass classFcc: FourCharCode) -> [NSAppleEventDescriptor] {
        let event = AppObjectSpecifier.sharedApp.coreEvent(eventID: FourCharCode.getData)
        
        let directObjectSpecifier = objSpec.every(classFcc)
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

    public func make(new whatClass: FourCharCode, props: NSAppleEventDescriptor) -> NSAppleEventDescriptor? {
        guard let app = SPApp.shared else {
            return NSAppleEventDescriptor.null()
        }
        return app.make(new: whatClass, container: self.objSpec, props: props)
     }

    public func property(_ propCode: FourCharCode) -> SPObjectProperty? {
        return SPObjectProperty(spObject: self, propCode: propCode)
     }
}
