//
//  PhoneDetailsViewController.swift
//  PhonesList
//
//  Created by Opryatnov Dmitriy on 4/27/20.
//  Copyright © 2020 Opryatnov Dmitriy. All rights reserved.
//

import UIKit
import SnapKit

protocol PhoneDetailsViewControllerDelegate: class {
    func saveButtonClicked(phoneModel: PhoneModel, index: Int)
}

enum DetailsState {
    case edit
    case save
    
    var buttonState: String {
        switch self {
        case .edit:
            return "Save"
        case .save:
            return "Edit"
        }
    }
}

class PhoneDetailsViewController: UIViewController {
    
    private var phoneView: PhoneInfoView?
    var phoneModel: PhoneModel?
    var index: Int = 0
    private var addPhoneView: PhoneDetailsEditView?
    
    @IBOutlet weak var phoneContainerView: UIView!
    @IBOutlet weak var addPhoneContainerView: UIView!
    @IBOutlet weak var phoneDetailsEditButton: UIButton!
    
    var state: DetailsState = .save
    
    weak var delegate: PhoneDetailsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtonState(state)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureContainerView()
    }
    
    private func configureButtonState(_ state: DetailsState) {
        phoneDetailsEditButton.setTitle(state.buttonState, for: .normal)
    }
    
    @IBAction func editPhoneDetails(_ sender: UIButton) {
        if state == .edit {
            state = .save
            configureButtonState(state)
            if let addPhoneView = addPhoneView {
                let phone: PhoneModel = PhoneModel(phoneName: addPhoneView.phoneName.text,
                                                   phoneModel: addPhoneView.phoneModel.text,
                                                   marketEntryDate: addPhoneView.marketEntryDate.text,
                                                   manufacturer: addPhoneView.manufacturer.text,
                                                   osVersion: addPhoneView.osVersion.text,
                                                   phonePhoto: nil)
                
                delegate?.saveButtonClicked(phoneModel: phone, index: index)
            }
            configureContainerView()
            addPhoneView?.removeFromSuperview()
            
        } else {
            state = .edit
            configureButtonState(state)
            configureAddPhoneContainerView()
            phoneView?.removeFromSuperview()
            
        }
    }
    
    private func configureContainerView() {
        if let phoneModel = phoneModel {
            phoneView = PhoneInfoView.configureView(model: phoneModel)
            phoneContainerView.addSubview(phoneView!)
            phoneView!.snp.makeConstraints { (make) in
                make.left.equalTo(0)
                make.right.equalTo(0)
                make.top.equalTo(0)
                make.bottom.equalTo(0)
            }
        }
    }
    
    private func configureAddPhoneContainerView() {
        if let phoneModel = phoneModel {
            addPhoneView = PhoneDetailsEditView.configureView(model: phoneModel)
            phoneContainerView.addSubview(addPhoneView!)
            addPhoneView!.snp.makeConstraints { (make) in
                make.left.equalTo(0)
                make.right.equalTo(0)
                make.top.equalTo(0)
                make.bottom.equalTo(0)
            }
        }
    }
}
