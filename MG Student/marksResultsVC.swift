//
//  marksResultsVC.swift
//  MG Student
//
//  Created by Cyberheights Software Technologies Pvt Ltd on 16/12/20.
//

import UIKit
import Loaf




class marksResultsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var marksTbl: UITableView!
    @IBOutlet weak var resultTitle: UILabel!
    
    var rollID: Int?
    var markDetais : [MarksResult]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadingView.shouldTapToDismiss = false
        loadingView.show(on: view)
               
//        let dflts = UserDefaults.standard
//        let htno = dflts.value(forKey: "HallTicket")
        
        guard let gitUrl = URL(string: marksApi + "400815468031&rollID=\(self.rollID ?? 0)") else { return }
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
                self.markDetais = try decoder.decode([MarksResult].self, from: data)
                            
                print("gitData:\(self.markDetais ?? [])")
                
                DispatchQueue.main.async {
                    
                    if self.markDetais?.count ?? 0>0 {
                        self.resultTitle.text =  "* \(self.markDetais?[0].CONS ?? "")"
                        loadingView.hide()
                        self.marksTbl.isHidden = false
                        self.marksTbl.reloadData()
                                                    
                }else {
                    loadingView.hide()
                    Loaf("No Data Found.", state: .error, sender: self).show()
                    self.marksTbl.isHidden = true
                    
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
        if self.markDetais?.count ?? 0>0 {
            let tmp : Int = self.markDetais?.count ?? 0
            print("Count:\(tmp)")
            return   tmp + 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cll : UITableViewCell = UITableViewCell.init()
        
        if indexPath.row == 0  {
            let cl : resultCell = tableView.dequeueReusableCell(withIdentifier: "resltFinal4", for: indexPath) as! resultCell
            
            cl.sgpa.text = "Grand Total: \(self.markDetais?[0].GRANDTOTAL ?? 0)"
            cl.resultStatus.text = "RES: \(self.markDetais?[0].STATUSNAME ?? "")"
            
            cll = cl
            
        }else if indexPath.row == 1 {
            let cl : resultCell = tableView.dequeueReusableCell(withIdentifier: "resltHead4", for: indexPath) as! resultCell
            
            cll = cl
            
        } else if indexPath.row > 1 {
            let cl : resultCell = tableView.dequeueReusableCell(withIdentifier: "resltData4", for: indexPath) as! resultCell
            
            cl.subjectType.text = "\(self.markDetais?[indexPath.row-2].SUBJECTTYPE ?? "")"
            cl.subjectName.text = "\(self.markDetais?[indexPath.row-2].SUBJECTNAME ?? "")"
            cl.thearyMarks.text = "\(self.markDetais?[indexPath.row-2].THEORYMARKS ?? 0)"
            cl.result.text = "\(self.markDetais?[indexPath.row-2].RESULT ?? "")"

            
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
