//
//  BodyPartCell.swift
//  fitnessApp
//
//  Created by Abduraxmon on 06/04/23.
//

import UIKit

class BodyPartCell: UITableViewCell {
    
    
    @IBOutlet weak var bodyPartImage: UIImageView!
    @IBOutlet weak var BodyPartLbl: UILabel!
    @IBOutlet weak var xpLvl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
