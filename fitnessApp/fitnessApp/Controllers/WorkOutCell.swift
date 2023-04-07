//
//  WorkOutCell.swift
//  fitnessApp
//
//  Created by Abduraxmon on 06/04/23.
//

import UIKit

class WorkOutCell: UITableViewCell {
    
    @IBOutlet weak var workOutImage: UIImageView!
    @IBOutlet weak var workOutName: UILabel!
    @IBOutlet weak var xpLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(_ item: ModelElement?) {
        
        guard let exercise = item else {
            return
        }
        
        workOutName.text = exercise.name
        guard exercise.gifURL != "" else {
            return
        }
        
        var gifURL : String = exercise.gifURL!
        gifURL.removeFirst(4)
        gifURL = "https" + gifURL
        
        
        let url = URL(string: gifURL)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                
                DispatchQueue.main.async {
                    let advTimeGif = UIImage.gifImageWithData(data!)
                    self.workOutImage.image = advTimeGif
                }
            }
            
        }
        // start dataTask
        dataTask.resume()
        
    }
    
    
}
