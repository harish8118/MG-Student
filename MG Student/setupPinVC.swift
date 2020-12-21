//
//  setupPinVC.swift
//  MG Student
//
//  Created by Cyberheights Software Technologies Pvt Ltd on 17/12/20.
//

import UIKit

class setupPinVC: UIViewController {
    
    @IBOutlet weak var pinTF: UITextField!
    @IBOutlet weak var cnfrmPinTF: UITextField!
    @IBOutlet weak var sumbitBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sumbitAct(_ sender: Any) {
        
    }
   

}
