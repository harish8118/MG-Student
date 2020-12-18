//
//  signinVC.swift
//  MG Student
//
//  Created by Cyberheights Software Technologies Pvt Ltd on 17/12/20.
//

import UIKit

class signinVC: UIViewController {

    @IBOutlet weak var backVW: UIImageView!
    @IBOutlet weak var logoVW: UIImageView!
    @IBOutlet weak var htTF: UITextField!
    @IBOutlet weak var mblTF: UITextField!
    @IBOutlet weak var signBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.signBttn.layer.cornerRadius = self.signBttn.frame.height/2
        self.signBttn.layer.masksToBounds = true
        
    }
    
    @IBAction func signinAct(_ sender: UIButton) {
        let vc : confirmVC = self.storyboard?.instantiateViewController(identifier: "confirmVC") as! confirmVC
        self.navigationController?.show(vc, sender: signBttn)
       // self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
