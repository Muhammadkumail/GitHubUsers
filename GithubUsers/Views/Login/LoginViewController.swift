//
//  LoginViewController.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 12/07/2022.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var txtField: UITextField!
    var viewModel: LoginViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        upateView(status: false)
    }
    
    func setupViewModel() {
        viewModel = LoginViewModel.init(networkManager: UserListInteractor.init(userListNetworkService: UserListNetworkService()))
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
       
        if txtField.text?.isEmpty ?? false {
            AlertService.sharedInstance.displayAlert(message: Alert.loginTypeEmpty.rawValue)
        } else {
            upateView(status: true)
            viewModel?.getUsers(type: txtField.text ?? "", controller: self)
        }
    }
    
    func upateView(status: Bool) {
        
        switch status {
        case true:
            loader.startAnimating()
            loginBtn.isHidden = true
            loader.isHidden = false
        case false:
            loginBtn.isHidden = false
            loader.isHidden = true
            loader.stopAnimating()
            loader.hidesWhenStopped = true
        }
    }
}



