//
//  otpVC.swift
//  MG Student
//
//  Created by Cyberheights Software Technologies Pvt Ltd on 17/12/20.
//

import UIKit

class otpVC: UIViewController {

    @IBOutlet weak var otpTF: UITextField!
    @IBOutlet weak var otpLbl: UILabel!
    @IBOutlet weak var vrfyBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.vrfyBttn.layer.cornerRadius = 10.0
        self.vrfyBttn.layer.masksToBounds = true
        
    }
    
    @IBAction func verifyAct(_ sender: UIButton) {
        let vc : dashVC = self.storyboard?.instantiateViewController(identifier: "dashVC") as! dashVC
        self.navigationController?.show(vc, sender: vrfyBttn)

        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backAct(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
   

}
