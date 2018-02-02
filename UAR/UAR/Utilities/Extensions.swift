//
//  Extensions.swift
//  UAR
//
//  Created by Djuro Alfirevic on 2/1/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: Buttons.ok, style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
}
