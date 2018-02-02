//
//  ChangePINViewController.swift
//  UAR
//
//  Created by Djuro Alfirevic on 2/1/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import UIKit

class ChangePINViewController: PINViewController {

    // MARK: - Properties
    @IBOutlet weak var newPinCodeTextField: PinCodeTextField!
    @IBOutlet weak var repeatPinCodeTextField: PinCodeTextField!
    @IBOutlet weak var enterPinLabel: UILabel!
    @IBOutlet weak var reenterPinLabel: UILabel!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Public API
    override func successfulLogin() {
        UIView.animate(withDuration: DEFAULT_ANIMATION_DURATION) {
            self.pinCodeTextField.alpha = 0.0
            self.newPinCodeTextField.alpha = 1.0
            self.repeatPinCodeTextField.alpha = 1.0
            self.enterPinLabel.alpha = 1.0
            self.reenterPinLabel.alpha = 1.0
        }
    }
    
    // MARK: - Configurable
    override func configureView() {
        super.configureView()
        
        newPinCodeTextField.alpha = 0.0
        repeatPinCodeTextField.alpha = 0.0
        enterPinLabel.alpha = 0.0
        reenterPinLabel.alpha = 0.0
        newPinCodeTextField.delegate = self
        repeatPinCodeTextField.delegate = self
    }
    
    // MARK: - PinCodeTextFieldDelegate
    override func textFieldDidEndEditing(_ textField: PinCodeTextField) {
        if textField == pinCodeTextField {
            super.textFieldDidEndEditing(textField)
        } else if textField == repeatPinCodeTextField {
            guard let newPIN = newPinCodeTextField.text, let repeatNewPIN = repeatPinCodeTextField.text else {
                return
            }
            
            if newPIN == repeatNewPIN {
                UserDefaults.standard.set(newPIN, forKey: Keys.pin)
                UserDefaults.standard.synchronize()
                navigationController?.popViewController(animated: true)
            } else {
                presentAlert(Errors.error, message: Errors.pinsDontMatch)
                repeatPinCodeTextField.text = ""
            }
        }
    }

}
