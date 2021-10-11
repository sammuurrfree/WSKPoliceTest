//
//  Wanted.swift
//  WSKPolice
//
//  Created by Преподаватель on 11.10.2021.
//

import Foundation

struct WantedModels: Codable{
    let data: [WantedModel]
    let success: Bool
}

struct WantedModel: Codable{
    let id: String
    let status: String
    let first_name: String
    let last_name: String
    let last_location: String
    let nicknames: String
    let description: String
    let photo: String
}

class Wanted{
    
    func getData(complitionHandler: @escaping(_ departaments: WantedModels?) -> ()) {
        
        var request = URLRequest(url: URL(string: "http://mad2019.hakta.pro/api/wanted/")!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let departaments = try? JSONDecoder().decode(WantedModels.self , from: data ?? Data())
            complitionHandler(departaments)
        }
        
        task.resume()
    }
    
}

