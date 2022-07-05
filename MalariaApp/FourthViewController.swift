//
//  FourthViewController.swift
//  MalariaApp
//
//  Created by Srihita on 4/16/22.
//

import Foundation
import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var labTestButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func labTestButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "labTestSegue", sender: self)
    }
}
