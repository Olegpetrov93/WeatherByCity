//
//  Extension.swift
//  TestWeather
//
//  Created by Алла Даминова on 15.07.2021.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewController {
    func alertPlusCity(name: String, placeholder: String, completionHandler: @escaping(String) -> Void) {
        
        let alertController = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ok", style: .default) { action in
            let textfieldText = alertController.textFields?.first
            guard let text = textfieldText?.text else { return }
            completionHandler(text)
        }
        let alertCancel = UIAlertAction(title: "Отмена", style: .default) { _ in }
        
        alertController.addTextField { tf in
            tf.placeholder = placeholder
        }
        
        alertController.addAction(alertOk)
        alertController.addAction(alertCancel)
        present(alertController, animated: true , completion: nil)
    }
    
    func alertWrongCity(title: String) {
        let alertController = UIAlertController(title: title , message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ок", style: .default) { _ in }
        alertController.addAction(alertOk)
        present(alertController, animated: true , completion: nil)
    }
}

extension UIFont {
    class var textStyle3: UIFont {
        return UIFont.systemFont(ofSize: 20.0, weight: .regular)
    }
}

extension UIColor {
    @nonobjc class var blueGrey: UIColor {
        return UIColor(red: 98.0 / 255.0, green: 127.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
    }
}
