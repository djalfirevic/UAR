//
//  Strings.swift
//  UAR
//
//  Created by Djuro Alfirevic on 2/1/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import Foundation

public struct Defaults {
    static let pin = "123456"
}

public struct Keys {
    static let codeAttempts = "codeAttempts"
    static let pin = "PIN"
}

public struct Buttons {
    static let ok = "OK"
}

public struct Errors {
    static let error = "Error"
    static let tooManyAttempts = "Too many PIN attempts.\nPlease try again later."
    static let pinsDontMatch = "Provided PINs do not match"
}

public struct Segues {
    static let wallet = "WalletSegue"
}
