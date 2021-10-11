//
//  WantedViewController.swift
//  WSKPolice
//
//  Created by Преподаватель on 11.10.2021.
//

import UIKit

class WantedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var delteView: UIView!
    
    let wanted = Wanted()
    var wantedList: [WantedModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wanted.getData { departaments in
            if departaments != nil{
                self.wantedList = departaments!.data
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

}


extension WantedViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wantedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WantedTableViewCell", for: indexPath) as! WantedTableViewCell
        
        cell.titleLabel.text = "\(wantedList[indexPath.row].last_name.replacingOccurrences(of: "\t", with: "")) \(wantedList[indexPath.row].first_name.replacingOccurrences(of: "\t", with: ""))"
        cell.profilImageView.image = UIImage(data: try! Data(contentsOf: URL(string: wantedList[indexPath.row].photo)!))
        
        return cell
    }
    
}
