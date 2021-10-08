//
//  PhotoRobot.swift
//  WSKPolice
//
//  Created by KS54 on 21.09.2021.
//

import Foundation
import UIKit

class PhotoRobot {
    
    var images: [UIImage] = [
        UIImage(named: "diyanov_vladislav")!,
        UIImage(named: "kozlova_tatyana")!,
        UIImage(named: "nikita_sitnik")!,
        UIImage(named: "potapov_matveiy")!,
        UIImage(named: "shakirov_danil")!,
        UIImage(named: "unashhotleeva_oksana")!
    ]
    private let userDefualts = UserDefaults()
    
    var bottomImage: [UIImage] {
        var imageAraay: [UIImage] = []
        
        for i in 0..<200{
            imageAraay.append(UIImage(named: "bottom\(i)")!)
        }
        
        return imageAraay
    }
    
    var middleImage: [UIImage] {
        var imageAraay: [UIImage] = []
        
        for i in 0..<200{
            imageAraay.append(UIImage(named: "middle\(i)")!)
        }
        
        return imageAraay
    }
    
    var topImage: [UIImage] {
        var imageAraay: [UIImage] = []
        
        for i in 0..<200{
            imageAraay.append(UIImage(named: "top\(i)")!)
        }
        
        return imageAraay
    }
    
    
    func getImages() -> [Data] {
        var returnData: [Data]? = try? PropertyListDecoder().decode([Data].self, from: userDefualts.data(forKey: "images") ?? Data())
        
        if returnData == nil || returnData?.count == 0 {
            var newData: [Data] = []
            
            for item in images{
                newData.append(item.pngData() ?? Data())
            }
            
            userDefualts.set(try? PropertyListEncoder().encode(returnData), forKey: "images")
            return newData
        }
            
        return returnData!
    }
    
    
    func addImages(imageData: Data) {
        var data = getImages()
        data.append(imageData)
        
        userDefualts.set(try? PropertyListEncoder().encode(data), forKey: "images")
    }
    
    
}

