//
//  WantedTableViewCell.swift
//  WSKPolice
//
//  Created by Преподаватель on 11.10.2021.
//

import UIKit

class WantedTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profilImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
