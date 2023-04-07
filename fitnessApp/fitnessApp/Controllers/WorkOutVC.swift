//
//  WorkOutVC.swift
//  fitnessApp
//
//  Created by Abduraxmon on 06/04/23.
//

import UIKit

class WorkOutVC: UIViewController, ModelDelegate {
   
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var tableview: UITableView!
    var model = ApiResponse()
    var bodyParts: Model?
    var randomNums = [Int]()
    var muscle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        
        setUpTableView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        model.getData(muscle)
    }
    
    func setUpTableView() {
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "WorkOutCell" , bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
    
    func dataFetch(_ data: Model) {
        bodyParts = data
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
}

extension WorkOutVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if bodyParts != nil {
            return bodyParts!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorkOutCell
        let randomNum = Int.random(in: 10...20)
        randomNums.append(randomNum)
        
        cell.xpLbl.text = "+\(randomNum) xp"
        if let bodyPart = bodyParts?[indexPath.row] {
            cell.setCell(bodyPart)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if bodyParts != nil {
            return 150
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = WorkOutDetailVC(nibName: "WorkOutDetailVC", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated: true)
        vc.execiseLbl.text = bodyParts?[indexPath.row].name
        vc.equpipmentLbl.text = " equipments: " + (bodyParts?[indexPath.row].equipment ?? "")
        vc.gifURL =  bodyParts?[indexPath.row].gifURL ?? ""
        vc.xpLbl.text = "+\(randomNums[indexPath.row]) xp"
        vc.xp = randomNums[indexPath.row]
    }
    
}
