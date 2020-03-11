//
//  DetailsCell.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/10/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import UIKit
import Kingfisher
class DetailsCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var detailsIV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureDetailsCell(image :String ,name:String , description:String){
        let imgUrl = URL(string: image)
             detailsIV.kf.setImage(with: imgUrl)
             nameLbl.text = name
             descLbl.text = description
         }
    }

