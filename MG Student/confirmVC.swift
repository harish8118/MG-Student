//
//  confirmVC.swift
//  MG Student
//
//  Created by Cyberheights Software Technologies Pvt Ltd on 17/12/20.
//

import UIKit

class confirmVC: UIViewController {

    @IBOutlet weak var cnfrmLbl: UILabel!
    @IBOutlet weak var cnfrmBttn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cnfrmBttn.layer.cornerRadius = 10.0
        self.cnfrmBttn.layer.masksToBounds = true
        
    }
    
    @IBAction func cnfrmAct(_ sender: UIButton) {
        
        let vc : otpVC = self.storyboard?.instantiateViewController(identifier: "otpVC") as! otpVC
        self.navigationController?.show(vc, sender: cnfrmBttn)
       // self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    

}
