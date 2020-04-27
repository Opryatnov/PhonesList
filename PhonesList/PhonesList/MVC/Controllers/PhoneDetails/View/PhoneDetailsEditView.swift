//
//  PhoneDetailsEditView.swift
//  PhonesList
//
//  Created by Opryatnov Dmitriy on 4/27/20.
//  Copyright © 2020 Opryatnov Dmitriy. All rights reserved.
//
import UIKit

class PhoneDetailsEditView: UIView {

@IBOutlet weak var phoneName: UILabel!
@IBOutlet weak var phoneModel: UILabel!
@IBOutlet weak var marketEntryDate: UILabel!
@IBOutlet weak var manufacturer: UILabel!
@IBOutlet weak var osVersion: UILabel!
@IBOutlet weak var phonePhoto: UIImageView!



    class func configureView(model: PhoneModel) -> PhoneDetailsEditView {
        let phoneView = UINib(nibName: String(describing: PhoneDetailsEditView.self),
                              bundle: .main).instantiate(withOwner: nil, options: nil).first as! PhoneDetailsEditView
    
        phoneView.configure(model: model)
        return phoneView
    }
    
    private func configure(model: PhoneModel) {
       
        phoneName.text = "Phone name: \(model.phoneName ?? "")"
        phoneModel.text = "Phone model: \(model.phoneModel ?? "")"
        marketEntryDate.text = "Market entry date: \(model.marketEntryDate ?? "")"
        manufacturer.text = "Made in: \(model.manufacturer ?? "")"
        osVersion.text = " Version OS: \(model.osVersion ?? "")"
        
        phonePhoto.image = nil
        if let photo = model.phonePhoto {
        phonePhoto.image = UIImage(named: photo)
        }
    }
}

