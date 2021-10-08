//
//  ViewController.swift
//  WSKPolice
//
//  Created by KS54 on 20.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    
    @IBOutlet weak var buttonAndTextField: UIStackView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var caphaLabel: UILabel!
    @IBOutlet weak var capchaTextField: UITextField!
    
    @IBOutlet weak var topView: UIStackView!
    @IBOutlet weak var bottomView: UIStackView!
    
    
    var login = ""
    var password = ""
    var capha = ""
    var capchaCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let authData = Authorization.saveMeGet()
        
        if authData != nil {
            login = authData!.login
            password = authData!.password
        }
        
        loginTextField.text = login
        passwordTextField.text = password
 
        bottomView.isHidden = true

        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    
    //  Метод валидации
    @IBAction func sifinButton(_ sender: UIButton) {
        let resValid = Authorization.validiationAuth(login: loginTextField.text, password: passwordTextField.text)
        
        if resValid != ""{
            if capchaCount > 1{
                topView.isHidden = !topView.isHidden
                bottomView.isHidden = !bottomView.isHidden
                
                capha = Authorization.genCapcha()
                caphaLabel.text = capha
                capchaCount = 0
            }else{
                capchaCount += 1
            }
            
            sendError(description: resValid)
        }else{
            if rememberMeSwitch.isOn {
                Authorization.saveMeSet(login: loginTextField.text!, password: passwordTextField.text!)
            }
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "auth")
            show(vc!, sender: vc)
        }

    }
    
    
    @IBAction func caphaWrite(_ sender: UIButton) {
        
        if capchaTextField.text == capha {
            topView.isHidden = !topView.isHidden
            bottomView.isHidden = !bottomView.isHidden
        }else{
            let alert = UIAlertController(title: "Error", message: "Капча набрана неверно, попробуйте еще раз", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Изменить капчу", style: .default, handler: { action in
                
                self.capha = Authorization.genCapcha()
                self.caphaLabel.text = self.capha
                
            }))
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            
            present(alert, animated: true)
        }
        
    }
    
    // Обработка ошибок
    private func sendError(title:String, description: String) {
        
        let alert = UIAlertController(title: title,  message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true)
        
        return
    }
    
    // Обработка ошибок
    private func sendError(description: String) {
        
        let alert = UIAlertController(title: "Error", message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true)
        
        return
    }
    
    
    
    // Скрытие клавиатуры
    @IBAction func hideKeyboard(_ sender: Any) {
        
        view.endEditing(true)
    }
    

}

