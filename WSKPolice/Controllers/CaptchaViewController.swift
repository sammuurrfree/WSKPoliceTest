//
//  CaptchaViewController.swift
//  WSKPolice
//
//  Created by KS54 on 21.09.2021.
//

import UIKit

class CaptchaViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.navigationController?.navigationBar.isHidden = true
    }
}
