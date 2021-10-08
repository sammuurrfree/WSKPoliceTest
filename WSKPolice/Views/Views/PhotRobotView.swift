//
//  PhotRobotView.swift
//  WSKPolice
//
//  Created by Преподаватель on 07.10.2021.
//

import UIKit

class PhotRobotView: UIView {
}

extension PhotRobotView{
    func screenShot() -> UIImage? {
        let render = UIGraphicsImageRenderer(size: frame.size)
        
        return render.image { _ in drawHierarchy(in: bounds, afterScreenUpdates: true) }
    }
}
