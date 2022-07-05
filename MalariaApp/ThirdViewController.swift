//
//  ThirdViewController.swift
//  MalariaApp
//
//  Created by Srihita on 4/16/22.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "signInSegue", sender: self)
    }
    @IBAction func buttonAddToList(_ sender: UIButton) {
        var passwordList: [String] = []
        let item = password.text

        passwordList.append(item!)

        for i in passwordList{
            print(i)
        }
                    
    }
}


