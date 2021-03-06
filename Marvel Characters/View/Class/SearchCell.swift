//
//  SearchCell.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/9/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var charLbl: UILabel!
    @IBOutlet weak var charIV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func configureCell(name:String , image : String ) {
           let imgUrl = URL(string: image)
           charIV.kf.setImage(with: imgUrl)
           charLbl.text = name
       }
    
}
