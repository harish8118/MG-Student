//
//  resultDetails1VC.swift
//  MG Student
//
//  Created by Cyberheights Software Technologies Pvt Ltd on 12/12/20.
//

import UIKit
import Loaf

class resultDetails1VC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var rsltDtlTbl: UITableView!
    @IBOutlet weak var resultTitle: UILabel!
    
    
    var rollID: Int?
    var resultDetais : [GradeResult]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadingView.shouldTapToDismiss = false
        loadingView.show(on: view)
               
//        let dflts = UserDefaults.standard
//        let htno = dflts.value(forKey: "HallTicket")
        
        guard let gitUrl = URL(string: gradeApi + "400815468031&rollID=\(self.rollID ?? 0)") else { return }
            print("url:\(gitUrl)")
            URLSession.shared.dataTask(with: gitUrl) { (data, response
                            , error) in
            
            DispatchQueue.main.async {
                    
            if let err = error {
                print("err:\(err)")
                Loaf("Something went wrong.Try again..", state: .error, sender: self).show()
                
                
            }
                
            guard let data = data else { return }
            do {
                                
                let decoder = JSONDecoder()
                self.resultDetais = try decoder.decode([GradeResult].self, from: data)
                            
                print("gitData:\(self.resultDetais ?? [])")
                
                DispatchQueue.main.async {
                    
                    if self.resultDetais?.count ?? 0>0 {
                        self.resultTitle.text =  "* \(self.resultDetais?[0].CONS ?? "")"
                        loadingView.hide()
                        self.rsltDtlTbl.isHidden = false
                        self.rsltDtlTbl.reloadData()
                                                    
                }else {
                    loadingView.hide()
                    Loaf("No Data Found.", state: .error, sender: self).show()
                    self.rsltDtlTbl.isHidden = true
                    
                }
                    
                }
                                
            } catch let err {
                print(err.localizedDescription)
                    loadingView.hide()
                Loaf("Something went wrong.Try again.", state: .error, sender: self).show()

                }
            }
            }.resume()
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.resultDetais?.count ?? 0>0 {
            return self.resultDetais?.count ?? 0 + 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cll : UITableViewCell = UITableViewCell.init()
        
        if indexPath.row == 0 {
            let cl : resultCell = tableView.dequeueReusableCell(withIdentifier: "resltHead", for: indexPath) as! resultCell
            
            cll = cl
            
        }else if indexPath.row == 1  {
            let cl : resultCell = tableView.dequeueReusableCell(withIdentifier: "resltFinal", for: indexPath) as! resultCell
            
            cl.sgpa.text = "SGPA: \(self.resultDetais?[0].SGPA ?? "")"
            cl.resultStatus.text = "RES: \(self.resultDetais?[0].STATUSNAME ?? "")"
            
            cll = cl
            
        } else if indexPath.row > 1 {
            let cl : resultCell = tableView.dequeueReusableCell(withIdentifier: "resltData", for: indexPath) as! resultCell
            
            cl.subjectCode.text = "\(self.resultDetais?[indexPath.row-1].SUBJECTCODE ?? "")"
            cl.subjectName.text = "\(self.resultDetais?[indexPath.row-1].SUBJECTNAME ?? "")"
            cl.creditPoint.text = "\(self.resultDetais?[indexPath.row-1].CREDITPOINT ?? 0)"
            cl.grade.text = "\(self.resultDetais?[indexPath.row-1].GRADE ?? "")"

            
            cll = cl
            
        }
        
        return cll
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row > 1 {
            return 80
        }
        
        return 40
    }
    
}
