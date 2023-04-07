//
//  AvatarVC.swift
//  fitnessApp
//
//  Created by Abduraxmon on 06/04/23.
//

import UIKit
import Lottie

class AvatarVC: UIViewController {
    
    @IBOutlet weak var levelLbl: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    private var animationView: LottieAnimationView?
    
    var levelCounter = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProgressView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.integer(forKey: K.level) == 0 {
            UserDefaults.standard.set(1, forKey: K.level)
        } else {
            levelCounter = UserDefaults.standard.integer(forKey: K.level)
            levelLbl.text = "Level \(levelCounter)"
        }
        
        if UserDefaults.standard.integer(forKey: K.xpKey) / 100 != levelCounter && UserDefaults.standard.integer(forKey: K.xpKey) != 0  {
            print(levelCounter)
            print(UserDefaults.standard.integer(forKey: K.xpKey))
            playAnimation()
            imageAnimation()
            levelCounter = UserDefaults.standard.integer(forKey: K.xpKey) / 100
            UserDefaults.standard.set(levelCounter, forKey: K.level)
            levelLbl.text = "Level \(levelCounter)"
        }
        
        let progress = Float(UserDefaults.standard.integer(forKey: K.xpKey) % 100) / 100
        
        UIView.animate(withDuration: 1) {
            self.progressView.setProgress(progress, animated: true)
        }
    }
    
    
    
    func playAnimation() {
        animationView?.frame = CGRect(x: 0, y: 0, width: 250, height: 300)
        
        let viewX = view.frame.width / 2 - 250 / 2
        let viewY = view.frame.height / 2 - 170
        
        // 2. Start AnimationView with animation name (without extension)
          animationView = .init(name: "114400-level-up-animation")
        animationView!.frame = CGRect(x: viewX, y: viewY, width: 250, height: 300)
          // 3. Set animation content mode
          animationView!.contentMode = .scaleAspectFit
          // 4. Set animation loop mode
          animationView!.loopMode = .playOnce
          // 5. Adjust animation speed
          animationView!.animationSpeed = 0.5
          view.addSubview(animationView!)
          // 6. Play animation
          animationView!.play()
    }
    
    func setUpProgressView() {
        //progressView.transform = progressView.transform.scaledBy(x: 1, y: 4)
        progressView.progress = 0.0
                
                progressView.layer.cornerRadius = 10
                progressView.clipsToBounds = true
                progressView.layer.sublayers![1].cornerRadius = 10
                progressView.subviews[1].clipsToBounds = true
    }
    
    func imageAnimation() {
        UIView.animate(withDuration: 1) {
            self.avatarImage.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.avatarImage.transform = .identity
        }
        
    }

}
