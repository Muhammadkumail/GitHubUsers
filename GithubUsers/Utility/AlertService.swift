//
//  AlertService.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 11/07/2022.
//

import Foundation
import UIKit

class AlertService {
    
    static var sharedInstance = AlertService()
    
    func showAlert(title:String, message:String, buttonText:String, controller: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: { action in
            switch action.style{
            case .default:
                return
            case .cancel:
                controller.dismiss(animated: true, completion: nil)
            case .destructive:
                return
             default:
                break
            }}))
        controller.present(alert, animated: true, completion: nil)
    }
    
    func displayAlert(message: String) {
        self.showAlert(title: Alert.alert.rawValue, message: message, buttonText: Alert.okButton.rawValue, controller: (UIApplication.shared.keyWindow?.rootViewController) ?? UIViewController())
    }
}
