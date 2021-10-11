//
//  ShowDepartamentViewController.swift
//  WSKPolice
//
//  Created by Преподаватель on 11.10.2021.
//

import UIKit

class ShowDepartamentViewController: UIViewController {

    
    @IBOutlet weak var departamentNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var bossNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var showHideDescriptionButton: UIButton!

    var departament: DepartamentModel?
    var descriptionShowFlag: Bool? {
        didSet{
            if descriptionShowFlag!{
                showHideDescriptionButton.setImage(UIImage(systemName: "arrowtriangle.up.square"), for: .normal)
                descriptionLabel.isHidden = false
            }else{
                showHideDescriptionButton.setImage(UIImage(systemName: "arrowtriangle.down.square"), for: .normal)
                descriptionLabel.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfo()
    }
    
    @IBAction func setHiddenDescription(_ sender: UIButton) {
        descriptionShowFlag = !descriptionShowFlag!
    }
    
    @IBAction func show(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
        let cord = departament!.coords.split(separator: ",")
        let cord1 = Double(cord[0].replacingOccurrences(of: "[", with: "").replacingOccurrences(of: " ", with: ""))
        let cord2 = Double(cord[1].replacingOccurrences(of: "]", with: "").replacingOccurrences(of: " ", with: ""))
        
        vc.cord = [cord1!, cord2!]
        vc.name = departament!.name
        vc.adreas = departament!.address
        
        show(vc, sender: nil)
    }
    
    func loadInfo() {
        descriptionShowFlag = false
        
        if departament != nil{
            departamentNameLabel.text = departament!.name
            addressLabel.text = departament!.address
            bossNameLabel.text = departament!.boss
            phoneNumberLabel.text = departament!.phone
            emailLabel.text = departament!.email
            descriptionLabel.text = departament!.description
        }
    }
    

}
