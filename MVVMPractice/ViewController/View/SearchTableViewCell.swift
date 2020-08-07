//
//  SearchTableViewCell.swift
//  MVVMPractice
//
//  Created by shruti Mittal on 7/13/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var dislaynameLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var userImageVw: CircularImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
