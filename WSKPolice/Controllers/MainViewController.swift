//
//  MainViewController.swift
//  WSKPolice
//
//  Created by KS54 on 20.09.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var departamentView: UIView!
    @IBOutlet weak var wantedView: UIView!
    @IBOutlet weak var photorobotView: UIView!
    @IBOutlet weak var paintView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        
        let alert = UIAlertController(title: "Вы зашли как гость", message: "Вы зашли как гость, поэтому часть функционала не доступна", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true)
    }
    


}
