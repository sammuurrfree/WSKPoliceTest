//
//  DepartamentViewController.swift
//  WSKPolice
//
//  Created by Преподаватель on 08.10.2021.
//

import UIKit

class DepartamentViewController: UIViewController{
    

    @IBOutlet weak var tableView: UITableView!
    var data: [DepartamentModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        loadAndReloadDepartamentData()
    }
    
    
    
    func loadAndReloadDepartamentData(){
        Departament().getData(complitionHandler: { departaments in
            if departaments != nil{
                self.data = departaments!.data
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }
    

}


extension DepartamentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepatmentTableViewCell", for: indexPath) as! DepatmentTableViewCell
        
        cell.titleLabel.text = data[indexPath.row].name
        cell.subtitleLabel.text = data[indexPath.row].address
        
        return cell
    }
}


extension DepartamentViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "showDepartamentViewController") as! ShowDepartamentViewController
        vc.departament = data[0]
        
        show(vc, sender: nil)
    }
}
