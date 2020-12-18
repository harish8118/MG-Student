//
//  dashVC.swift
//  MG Student
//
//  Created by Cyberheights Software Technologies Pvt Ltd on 12/12/20.
//

import UIKit


class dashVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    

    @IBOutlet weak var prflImg: UIImageView!
    @IBOutlet weak var sName: UILabel!
    @IBOutlet weak var htno: UILabel!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var dashTbl: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.prflImg.layer.cornerRadius = self.prflImg.frame.height/2
        self.prflImg.layer.masksToBounds = true
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var dsh :UICollectionViewCell = UICollectionViewCell.init()
        
        if indexPath.row == 0 {
            let cll : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mgDash", for: indexPath)
            
            dsh = cll
            
        }else if indexPath.row == 1 {
            let cll : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mgDash1", for: indexPath)
            
            dsh = cll
            
        }else if indexPath.row == 2 {
            let cll : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mgDash2", for: indexPath)
            
            dsh = cll
            
        }else if indexPath.row == 3 {
            let cll : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mgDash3", for: indexPath)
            
            dsh = cll
            
        }else if indexPath.row == 4 {
            let cll : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mgDash4", for: indexPath)
            
            dsh = cll
            
        }else if indexPath.row == 5 {
            let cll : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mgDash5", for: indexPath)
            
            dsh = cll
            
        }
        
        dsh.layer.cornerRadius = 30.0
        dsh.layer.masksToBounds = true
        

        
        
        return dsh
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc : resultVC = self.storyboard?.instantiateViewController(identifier: "resultVC") as! resultVC
            vc.navigationController?.navigationBar.isHidden = false
//            vc.navigationItem.setHidesBackButton(true, animated:false);
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.show(vc, sender: self)
            //self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    

}
