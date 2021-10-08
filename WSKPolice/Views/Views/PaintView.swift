//
//  PaintView.swift
//  WSKPolice
//
//  Created by Преподаватель on 07.10.2021.
//

import UIKit

class PaintView: UIView {

    var lines = [PointModel]()
    var strokeWidth: CGFloat = 1.0
    var strokeColor: UIColor = .darkText
    var strikeOpacaty: CGFloat = 1.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        lines.forEach{ (line) in
            for (i,p) in (line.points?.enumerated())! {
                if i == 0 {
                    context.move(to: p)
                }else{
                    context.addLine(to: p)
                }
                
                context.setStrokeColor(line.color?.withAlphaComponent(line.opacity ?? 1.0).cgColor ?? UIColor.black.cgColor)
                context.setLineWidth(line.width ?? 1.0)
            }
            context.setLineCap(.round)
            context.strokePath()
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(PointModel(color: UIColor(), points: [CGPoint]()))
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard var touch = touches.first?.location(in: nil) else {return}
        guard var lastPoint = lines.popLast() else {return}
        
        touch.y -= 160;
        
        lastPoint.points?.append(touch)
        lastPoint.color = strokeColor
        lastPoint.width = strokeWidth
        lastPoint.opacity = strikeOpacaty
        lines.append(lastPoint)
        setNeedsDisplay()
        
    }
    
    func clearCanvasView(){
        lines.removeAll()
        setNeedsDisplay()
    }

}

extension UIView{
    func takeScreeShot() -> UIImage{
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if image != nil{
            return image!
        }
        return UIImage()
    }
}
