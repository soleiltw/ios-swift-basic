//
//  StationViewCell.swift
//  Taipei-City-Water-Quality
//
//  Created by Edward Chiang on 21/10/2017.
//  Copyright © 2017 Soleil Software Studio Inc. All rights reserved.
//

import UIKit

class StationViewCell: UITableViewCell {
    
    @IBOutlet weak var quaIdLabel: UILabel!
    @IBOutlet weak var codeNameLabel: UILabel!
    
    @IBOutlet weak var ntuLabel: UILabel!
    @IBOutlet weak var mglLabel: UILabel!
    @IBOutlet weak var phLabel: UILabel!
    
    @IBOutlet weak var ntuValueLabel: UILabel!
    @IBOutlet weak var mglValueLabel: UILabel!
    @IBOutlet weak var phValueLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        self.quaIdLabel.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
