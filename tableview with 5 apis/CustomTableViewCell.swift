//
//  CustomTableViewCell.swift
//  tableview with 5 apis
//
//  Created by Ayush Sharma on 04/07/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
