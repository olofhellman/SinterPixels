//
//  SPApp.swift
//  SinterPixelsBridge
//
//  Created by Olof Hellman on 7/12/26.
//

import Foundation
import SinterAppleEvents

public class SPApp : SAEApp {
    nonisolated(unsafe) static let shared: SPApp? = SPApp()

    public init?() {
        super.init(identifier: "com.tomographic.sinterpixels")
    }
}
