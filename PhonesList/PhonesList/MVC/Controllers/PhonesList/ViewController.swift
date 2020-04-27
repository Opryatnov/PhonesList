//
//  ViewController.swift
//  PhonesList
//
//  Created by Opryatnov Dmitriy on 4/27/20.
//  Copyright © 2020 Opryatnov Dmitriy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var phoneList: [PhoneModel] = []
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let phone = PhoneModel(phoneName: "Iphone", phoneModel: "12", marketEntryDate: "10/10/2020", manufacturer: "China", osVersion: "iOS 12", phonePhoto: "iphone12")
        phoneList.append(phone)
    }

    private func showPhoneInfo(model: PhoneModel?) {
        guard let model = model else { return }
        let viewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: PhoneDetailsViewController.self)) as? PhoneDetailsViewController
        viewController?.phoneModel = model
        viewController?.delegate = self
        self.navigationController?.pushViewController(viewController!, animated: true)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phoneList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhonesTableViewCell.self), for: indexPath) as! PhonesTableViewCell
        cell.configureCell(phone: phoneList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
            showPhoneInfo(model: phoneList[indexPath.row])
        phoneList.remove(at: indexPath.row)
        print("index = \(indexPath.row)")
    }
}

extension ViewController: PhoneDetailsViewControllerDelegate {
    func saveButtonClicked(phoneModel: PhoneModel) {
        phoneList.append(phoneModel)
        tableView.reloadData()
        print("save button pressed")
    }
}
