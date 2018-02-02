//
//  WalletViewController.swift
//  UAR
//
//  Created by Djuro Alfirevic on 2/1/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController, Configurable {
    
    // MARK: - Properties
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var privateKeyLabel: UILabel!
    var address: BTCAddress?
    var key: BTCKey?
    
    // MARK: - Configurable
    func configureView() {
        addressLabel.adjustsFontSizeToFitWidth = true
        privateKeyLabel.adjustsFontSizeToFitWidth = true
    }
    
    // MARK: - Actions
    @IBAction func createButtonTapped() {
        if let key = BTCKey() {
            self.key = key
            
            print("Public Key: \(key.compressedPublicKeyAddress.string)")
            print("Private Key: \(key.privateKeyAddress.string)")
            privateKeyLabel.isHidden = true
            
            if let address = BTCAddress(string: key.compressedPublicKeyAddress.string) {
                self.address = address
                print(address)
                addressLabel.text = address.string
            }
        }
    }
    
    @IBAction func showButtonTapped() {
        if let pinViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: PINViewController.identifier) as? PINViewController {
            pinViewController.delegate = self
            present(pinViewController, animated: true)
        }
    }
    
}

extension WalletViewController: PINViewControllerDelegate {
    
    // MARK: - PINViewControllerDelegate
    func pinSuccessful() {
        if let key = key {
            privateKeyLabel.isHidden = false
            privateKeyLabel.text = key.privateKeyAddress.string
        }
    }
    
}
