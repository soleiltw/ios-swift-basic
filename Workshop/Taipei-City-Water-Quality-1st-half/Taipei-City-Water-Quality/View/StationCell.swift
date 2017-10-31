//
//  StationCell.swift
//  Taipei-City-Water-Quality
//
//  Created by Edward Chiang on 25/10/2017.
//  Copyright © 2017 Soleil Software Studio Inc. All rights reserved.
//

import UIKit

class StationCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ntuLabel: UILabel!
    @IBOutlet weak var mglLabel: UILabel!
    @IBOutlet weak var phLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
