//
//  DetailsCell.swift
//  appointment
//
//  Created by Mohamed Nawar on 3/15/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell {

    @IBOutlet weak var hairCut: UILabel!
    @IBOutlet weak var orderNumLbl: UILabel!
    @IBOutlet weak var customerLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
