//
//  Authorization.swift
//  WSKPolice
//
//  Created by KS54 on 21.09.2021.
//

import Foundation
import UIKit


struct AuthorizationModel {
    let login: String
    let password:String
}



// Класс авторизации
class Authorization {


    // Проверкка полей формы авторизации
    static func validiationAuth(login: String?, password: String?) -> String {
        
        let standartLogin = "admin@admin.com"
        let standartPassword = "admin"
        var flagOn = false
        var flagPoint = false
        
        if login == nil && login == ""{
            return "Заполните все поля!"
        }
        
        if password == nil && password == ""{
            return "Заполните все поля!"
        }
        
        
        for item in login!{
            if (item == ".")  { flagOn = true }
            if (item == "@") { flagPoint = true }
        }

        if !(flagOn && flagPoint) {
            return "Неверный Email. Email должен быть формата 'adreas@domen.ru' "
        }
        
        if (login! != standartLogin || password! != standartPassword) {
            return "Неверный пароль или Email"
        }else{
            return ""
        }
    }
    
    static func saveMeSet(login: String, password: String) {
        let userDefaults = UserDefaults()
        
        userDefaults.set(login, forKey: "login")
        userDefaults.set(password, forKey: "password")
        
        
    }
    
    static func saveMeGet() -> AuthorizationModel? {
        let userDefaults = UserDefaults()
        
        let login = userDefaults.string(forKey: "login")
        let password = userDefaults.string(forKey: "password")
        
        if ( (login != nil && login != "") && (password != nil && password != "" ) ){
            return AuthorizationModel(login: login!, password: password!)
        }
        
        return nil
    }
    
    
    static func genCapcha() -> String{
        let str = Array("QWERTYUIOPqwertyuiopasdfghjklASDFGHJKLzxcvbnmZXCVBNM1234567890")
        var genStr = ""
        
        for _ in 0...2{
            genStr += String(str[Int.random(in: 0...str.count)])
        }
        
        return genStr
    }
}


