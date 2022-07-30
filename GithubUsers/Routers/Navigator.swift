//
//  Navigator.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 11/07/2022.
//

import Foundation
import RxSwift

class Navigator {

    static var shared = Navigator()
    private init () {}
    
    func navigateToUserView(items: Observable<[Items]>?, controller: LoginViewController) {
        
        
        let vc = UsersViewController.instantiate(fromGithubUsersStoryBoards: .Main)
        let vm = UsersViewModel(items: items)
        vc.viewModel = vm
        controller.navigationController?.pushViewController(vc, animated: true)
    }
}
