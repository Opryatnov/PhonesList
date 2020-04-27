//
//  PhonesTableViewCell.swift
//  PhonesList
//
//  Created by Opryatnov Dmitriy on 4/27/20.
//  Copyright © 2020 Opryatnov Dmitriy. All rights reserved.
//

import UIKit

class PhonesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var phoneNameLabel: UILabel!
    @IBOutlet weak var phoneModelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(phone: PhoneModel?) {
        guard let phone = phone,
            let phoneName = phone.phoneName,
            let phoneModel = phone.phoneModel else { return }
        
        phoneNameLabel.text = phoneName
        phoneModelLabel.text = phoneModel
    }
}
