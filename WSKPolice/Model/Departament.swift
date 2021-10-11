//
//  Departament.swift
//  WSKPolice
//
//  Created by Преподаватель on 08.10.2021.
//

import Foundation

struct DepartamentsModel: Codable{
    let data: [DepartamentModel]
    let success: Bool
}

struct DepartamentModel: Codable{
    
    let id: String
    let address: String
    let name: String
    let boss: String
    let phone: String
    let email: String
    let description: String
    let coords: String
}


class Departament{
    
    func getData(complitionHandler: @escaping(_ departaments: DepartamentsModel?) -> ()) {
        
        var request = URLRequest(url: URL(string: "http://mad2019.hakta.pro/api/department")!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let departaments = try? JSONDecoder().decode(DepartamentsModel.self , from: data ?? Data())
            complitionHandler(departaments)
        }
        
        task.resume()
    }
    
}
