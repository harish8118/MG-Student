//
//  resultCell.swift
//  MG Student
//
//  Created by Cyberheights Software Technologies Pvt Ltd on 14/12/20.
//

import UIKit

class resultCell: UITableViewCell {
    
    @IBOutlet weak var noteDescription: UILabel!
    

    @IBOutlet weak var subjectCode: UILabel!
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var creditPoint: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var sgpa: UILabel!
    @IBOutlet weak var resultStatus: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
