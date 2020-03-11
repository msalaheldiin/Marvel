//
//  StoryCell.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/10/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import UIKit
 class StoryCell: UICollectionViewCell {
    @IBOutlet weak var storyIV: UIImageView!
     
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureStoryCell (image : String , name :String){
        storyIV.image = UIImage(named: "default")
        nameLbl.text = name
}
}
