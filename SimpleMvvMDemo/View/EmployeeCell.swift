//
//  EmployeeCell.swift
//  SimpleMvvMDemo
//
//  Created by User on 7/11/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class EmployeeCell: UITableViewCell {
    
    //MARK:- Employee Cell IBOulets
    
    @IBOutlet weak var E_image: UIImageView!
    @IBOutlet weak var E_name: UILabel!
    @IBOutlet weak var E_age: UILabel!
    @IBOutlet weak var E_salary: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
