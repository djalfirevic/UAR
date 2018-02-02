//
//  PINViewController.swift
//  UAR
//
//  Created by Djuro Alfirevic on 2/1/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import UIKit

protocol PINViewControllerDelegate: class {
    func pinSuccessful()
}

class PINViewController: UIViewController, PinCodeTextFieldDelegate, Configurable {
    
    // MARK: - Properties
    @IBOutlet weak var pinCodeTextField: PinCodeTextField!
    var attempts = 0
    weak var delegate: PINViewControllerDelegate?
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }

    // MARK: - Public API
    func successfulLogin() {
        if let delegate = delegate {
            delegate.pinSuccessful()
            dismiss(animated: true)
        } else {
            performSegue(withIdentifier: Segues.wallet, sender: nil)
        }
    }
    
    // MARK: - Private API
    fileprivate func performLogin(with pin: String) {
        pinCodeTextField.text = ""
        
        if Helpers.login(with: pin) {
            successfulLogin()
        } else {
            attempts += 1
            print("Wrong! Number of remaining attempts: \(MAXIMUM_ATTEMPTS - attempts)")
            
            if attempts == MAXIMUM_ATTEMPTS {
                presentAlert(Errors.error, message: Errors.tooManyAttempts)
                pinCodeTextField.isHidden = true
                pinCodeTextField.resignFirstResponder()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    fatalError("Consult with the bank so they can make you a new Bitcoin wallet :)")
                }
            }
        }
    }
    
    // MARK: - Configurable
    func configureView() {
        pinCodeTextField.delegate = self
        pinCodeTextField.becomeFirstResponder()
    }
    
    // MARK: - PinCodeTextFieldDelegate
    func textFieldDidEndEditing(_ textField: PinCodeTextField) {
        if let pin = textField.text {
            print("Entered PIN: \(pin)")
            
            performLogin(with: pin)
        }
    }
    
}
