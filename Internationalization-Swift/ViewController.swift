//
//  ViewController.swift
//  Internationalization-Swift
//
//  Created by vamsi krishna reddy kamjula on 7/27/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper


class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        if let string = textField.text {
            let save: Bool = KeychainWrapper.standard.set(string, forKey: "userString")
            print("Save was successful: \(save)")
        }
    }
    
    @IBAction func retrieveButton(_ sender: Any) {
        
        let retrievedString:String? = KeychainWrapper.standard.string(forKey: "userString")
        label.text = retrievedString!
        print("Retrieved String: \(retrievedString!)")
    }
    
    @IBAction func removeButton(_ sender: Any) {
        let remove:Bool = KeychainWrapper.standard.removeObject(forKey: "userString")
        print("Removed Successfully: \(remove)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let alertTitle = NSLocalizedString("Welcome", comment: "")
        let alertMsg = NSLocalizedString("how are you", comment: "")

        let alertAction = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: .alert)
        alertAction.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertAction, animated: true, completion: nil)

        print(alertTitle)
        print(alertMsg)
    }

}

