//
//  SPDocument.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/12/26.
//

import Foundation
import SinterAppleEvents

public extension FourCharCode {
    static var classDocument: FourCharCode { return FourCharCode(string: "docu")  }
}

public class SPDocument: SAEDocument {
    
    public func shapes() -> [SPShape] {
        let shapes = self.elements(ofClass: SPShape.fcc)
        return shapes.map { SPShape(app: app, objSpec: $0) }
    }
        
    public func shape(atASIndex asIndex: Int) -> SPShape? {
        guard let shp = element(ofClass: SPShape.fcc, atASIndex: asIndex) else {
            return nil
        }
        return SPShape(app: app, objSpec: shp)
    }
}
