//
//  Departament.swift
//  WSKPolice
//
//  Created by Преподаватель on 08.10.2021.
//

import Foundation


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
    
    func getData() -> [DepartamentModel]? {
        let semaphore = DispatchSemaphore (value: 0)
        var returnData: [DepartamentModel]? = nil

        var request = URLRequest(url: URL(string: "http://mad2019.hakta.pro/api/department")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          
            returnData = try? JSONDecoder().decode([DepartamentModel].self , from: data ?? Data())
            semaphore.signal()
            
            return
        }

        task.resume()
        semaphore.wait()
    
        return returnData
    }
    
}
