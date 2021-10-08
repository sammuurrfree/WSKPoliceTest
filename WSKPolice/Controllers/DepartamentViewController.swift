//
//  DepartamentViewController.swift
//  WSKPolice
//
//  Created by Преподаватель on 08.10.2021.
//

import UIKit

class DepartamentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    var data = Departament().getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        data = Departament().getData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepatmentTableViewCell", for: indexPath) as! DepatmentTableViewCell
        
        cell.titleLabel.text = data![indexPath.row].name
        cell.subtitleLabel.text = data![indexPath.row].address
        
        return cell
    }
    

}
