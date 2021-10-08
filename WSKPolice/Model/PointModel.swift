//
//  PointModel.swift
//  WSKPolice
//
//  Created by Преподаватель on 07.10.2021.
//

import Foundation
import UIKit

struct PointModel {
    var color:UIColor?
    var width:CGFloat?
    var opacity:CGFloat?
    var points:[CGPoint]?
    
    
    init(color: UIColor, points: [CGPoint]) {
        self.color = color
        self.points = points
    }
}
