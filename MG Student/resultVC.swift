//
//  resultVC.swift
//  MG Student
//
//  Created by Cyberheights Software Technologies Pvt Ltd on 12/12/20.
//

import UIKit
import Loaf



class resultVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    @IBOutlet weak var resultTbl: UITableView!
    var noteDetails : [Notes]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadingView.shouldTapToDismiss = false
        loadingView.show(on: view)
               
//        let dflts = UserDefaults.standard
//        let htno = dflts.value(forKey: "HallTicket")
        
        guard let gitUrl = URL(string: notfyApi + "400815468031") else { return }
            print("url:\(gitUrl)")
            URLSession.shared.dataTask(with: gitUrl) { (data, response
                            , error) in
            
            if let err = error {
                print("err:\(err)")
                let alert = UIAlertController(title: "Alert", message: "No internet is available. Please connect to network.", preferredStyle: UIAlertController.Style.actionSheet)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
                
            guard let data = data else { return }
            do {
                                
                let decoder = JSONDecoder()
                self.noteDetails = try decoder.decode([Notes].self, from: data)
                            
                print("gitData:\(self.noteDetails)")
                
                DispatchQueue.main.async {
                    
                    if self.noteDetails?.count ?? 0>0 {
                    loadingView.hide()
                    self.resultTbl.isHidden = false
                    self.resultTbl.reloadData()
                                                    
                }else {
                    loadingView.hide()
                    Loaf("No Data Found.", state: .error, sender: self).show()
                    self.resultTbl.isHidden = true
                    
                    
                }
                    
                }
                                
            } catch let err {
                print(err.localizedDescription)
                    loadingView.hide()
                Loaf("Something went wrong.Try again.", state: .error, sender: self).show()

                }
            }.resume()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.noteDetails?.count ?? 0 > 0 {
            return self.noteDetails?.count ?? 0
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cl : resultCell = tableView.dequeueReusableCell(withIdentifier: "result", for: indexPath) as! resultCell
        
        cl.noteDescription.text = " * \(self.noteDetails?[indexPath.row].LINK_DESCRIPTION ?? "Pass")"
        
        
        return cl
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc : resultDetails1VC = self.storyboard?.instantiateViewController(identifier: "resultDetails1VC") as! resultDetails1VC
        vc.rollID = self.noteDetails?[indexPath.row].ROLLID ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
