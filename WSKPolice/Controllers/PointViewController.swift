//
//  PointViewController.swift
//  WSKPolice
//
//  Created by Преподаватель on 07.10.2021.
//

import UIKit

class PointViewController: UIViewController, UICollectionViewDataSource{
    
    @IBOutlet weak var canvasView: PaintView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var slider: UISlider!
    
    let colors:[UIColor] = [UIColor.black,UIColor.blue,UIColor.brown,UIColor.cyan,UIColor.darkGray,UIColor.green,UIColor.magenta,UIColor.orange,UIColor.purple,UIColor.red,UIColor.yellow]
    var swith = false
    var swith2 = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaintCollectionViewCell", for: indexPath) as! PaintCollectionViewCell
        cell.contentView.backgroundColor = colors[indexPath.item]
        cell.button.tag = indexPath.item
        
        return cell
    }
    
    @IBAction func changeColorButton(_ sender: UIButton) {
        canvasView.strokeColor = colors[sender.tag]
    }
    
    @IBAction func changeColor(_ sender: Any) {
        if swith{
            slider.isHidden = true
            collectionView.isHidden = true
            swith = !swith
        }else{
            if swith2 == true {swith2 = false}
            slider.isHidden = true
            collectionView.isHidden = false
            swith = !swith
        }
    }
    
    @IBAction func changePointWidth(_ sender: Any) {
        if swith2{
            slider.isHidden = true
            collectionView.isHidden = true
            swith2 = !swith2
        }else{
            if swith == true {swith = false}
            collectionView.isHidden = true
            slider.isHidden = false
            swith2 = !swith2
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        canvasView.clearCanvasView()
    }
    
    @IBAction func slider(_ sender: Any) {
        canvasView.strokeWidth = CGFloat(slider.value)
    }
    
    @IBAction func shareMethod(_ sender: Any) {
        collectionView.isHidden = true
        slider.isHidden = true
        swith = false
        swith2 = false
        
        let activityItems = [canvasView.takeScreeShot()]
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
}


