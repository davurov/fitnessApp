//
//  WorkOutDetailVC.swift
//  fitnessApp
//
//  Created by Abduraxmon on 07/04/23.
//

import UIKit

class WorkOutDetailVC: UIViewController {
    
    @IBOutlet weak var xpLbl: UILabel!
    @IBOutlet weak var execiseLbl: UILabel!
    @IBOutlet weak var execiseImg: UIImageView!
    @IBOutlet weak var secLbl: UILabel!
    @IBOutlet weak var equpipmentLbl: UILabel!
    @IBOutlet var btns: [UIButton]!
    @IBOutlet weak var minLbl: UILabel!
    
    var gifURL = ""
    var timer: Timer?
    var currentXp = 100
    var xp = 0
    var secunds = 0
    var minutes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btns[1].isUserInteractionEnabled = false
        btns[1].alpha = 0.5
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        gifURL.removeFirst(4)
        gifURL = "https" + gifURL
        
        let url = URL(string: gifURL)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                
                DispatchQueue.main.async {
                    let advTimeGif = UIImage.gifImageWithData(data!)
                    self.execiseImg.image = advTimeGif
                }
            }
            
        }
        // start dataTask
        dataTask.resume()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.integer(forKey: K.xpKey) == 0 {
            UserDefaults.standard.set(100, forKey: K.xpKey)
        } else {
            currentXp = UserDefaults.standard.integer(forKey: K.xpKey)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        if btns[1].isUserInteractionEnabled {
            stop()
        }
        dismiss(animated: true)
    }
    
    
    @IBAction func btnsPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            btns[0].isUserInteractionEnabled = false
            btns[0].alpha = 0.5
            start()
            
            btns[1].isUserInteractionEnabled = true
            btns[1].alpha = 1
        } else {
            btns[0].isUserInteractionEnabled = true
            btns[0].alpha = 1
            stop()
            
            btns[1].isUserInteractionEnabled = false
            btns[1].alpha = 0.5
        }
    }
    
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self]_ in
            secunds += 1
            
            if secunds < 10 {
                secLbl.text = ":0\(secunds)"
            } else {
                secLbl.text = ":\(secunds)"
            }
            if secunds > 59 {
                secunds = 0
                secLbl.text = ":\(secunds)"
                minutes += 1
                if minutes < 10 {
                    minLbl.text = "0\(minutes)"
                } else {
                    minLbl.text = "\(minutes)"
                }
            }
        }
    }
    
    func stop() {
        self.timer?.invalidate()
        self.timer = nil
        
        if secunds >= 20 || minutes >= 1 {
            currentXp += xp
            print(currentXp)
            UserDefaults.standard.set(currentXp, forKey: K.xpKey)
        }
        minutes = 0
        secunds = 0
        minLbl.text = "00"
    }
    
}
