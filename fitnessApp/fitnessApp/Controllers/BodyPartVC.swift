//
//  BodyPartVC.swift
//  fitnessApp
//
//  Created by Abduraxmon on 06/04/23.
//

import UIKit

class BodyPartVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let model = ApiResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        
    }
    
    func setUpTable() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BodyPartCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    
}

extension BodyPartVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AddProgress.bodyParts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BodyPartCell
        cell.BodyPartLbl.text = AddProgress.bodyParts[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = WorkOutVC(nibName: "WorkOutVC", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated: true)
        vc.muscle = AddProgress.bodyParts[indexPath.row]
        vc.navTitle.text = AddProgress.bodyParts[indexPath.row]
        
    }
    
}
