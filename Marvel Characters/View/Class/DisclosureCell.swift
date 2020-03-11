//
//  disclosureCell.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/10/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import UIKit

class DisclosureCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.textLabel?.textColor = .white
        self.selectionStyle = .none
        let disclosureIcon = UIImage(named: "foward")
        self.accessoryView = UIImageView(image: disclosureIcon!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     }
    
}
