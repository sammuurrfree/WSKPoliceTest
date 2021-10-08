//
//  PhotoRobotViewController.swift
//  WSKPolice
//
//  Created by KS54 on 21.09.2021.
//

import UIKit

class PhotoRobotViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    var data = PhotoRobot().getImages()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        data = PhotoRobot().getImages()
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoRobotsCollectionViewCell", for: indexPath) as! PhotoRobotsCollectionViewCell
        cell.imageImageView.image = UIImage(data: data[indexPath.item])
        
        return cell
    }
    
}
