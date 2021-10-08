//
//  NewPhotoRobotViewController.swift
//  WSKPolice
//
//  Created by KS54 on 21.09.2021.
//

import UIKit

class NewPhotoRobotViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    @IBOutlet weak var middleCollectionView: UICollectionView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var stackView: PhotRobotView!
    
    let bottomImage = PhotoRobot().bottomImage
    let middleImage = PhotoRobot().middleImage
    let topImage = PhotoRobot().topImage
    let photoRobot = PhotoRobot()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
            
        case bottomCollectionView:
            return bottomImage.count
            
        case middleCollectionView:
            return middleImage.count
            
        case topCollectionView:
            return topImage.count
            
        default:
            return 0
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bottomCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FaceCollectionViewCell3", for: indexPath) as! FaceCollectionViewCell
            cell.bottomImage?.image = bottomImage[indexPath.item]
            
            return cell
        }
        if collectionView == middleCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FaceCollectionViewCell2", for: indexPath) as! FaceCollectionViewCell
            cell.middleImage?.image = middleImage[indexPath.item]
            
            return cell
        }
        if collectionView == topCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FaceCollectionViewCell1", for: indexPath) as! FaceCollectionViewCell
            cell.topImage?.image = topImage[indexPath.item]
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    @IBAction func shareMethod(_ sender: Any) {
        let image = stackView.screenShot()
        
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityController, animated: true)
    }
    
    @IBAction func saveMethod(_ sender: Any) {
        photoRobot.addImages(imageData: stackView.screenShot()?.pngData() ?? Data())
    }
    
}
