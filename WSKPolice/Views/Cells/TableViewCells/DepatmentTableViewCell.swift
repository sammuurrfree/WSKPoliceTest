//
//  DepatmentTableViewCell.swift
//  WSKPolice
//
//  Created by Преподаватель on 08.10.2021.
//

import UIKit

class DepatmentTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
