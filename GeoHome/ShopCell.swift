//
//  ShopCell.swift
//  GeoHome
//
//  Created by Vadim Drobinin on 26/5/16.
//  Copyright © 2016 Vadim Drobinin. All rights reserved.
//

import UIKit

class ShopCell: UITableViewCell {
  @IBOutlet weak var triggerNameLabel: UILabel!
  @IBOutlet weak var actionNameLabel: UILabel!
  
  @IBOutlet weak var priceLabel: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
