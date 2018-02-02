//
//  Helpers.swift
//  UAR
//
//  Created by Djuro Alfirevic on 2/1/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import Foundation

class Helpers {
    
    static func login(with pin: String) -> Bool {
        if let userPIN = UserDefaults.standard.value(forKey: Keys.pin) as? String {
            return pin == userPIN
        }
        
        return pin == DEFAULT_PIN
    }
    
}
