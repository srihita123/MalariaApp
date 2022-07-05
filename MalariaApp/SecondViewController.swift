//
//  SecondViewController.swift
//  MalariaApp
//
//  Created by Srihita on 4/16/22.
//

import Foundation
import UIKit
class SecondViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 300
        
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "loginSegue", sender: self)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "registerSegue", sender: self)
    }
    
}
