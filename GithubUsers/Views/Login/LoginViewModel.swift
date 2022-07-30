//
//  LoginViewModel.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 12/07/2022.
//

import Foundation
import RxSwift

class LoginViewModel {
    
    private let networkManager: UserListInteractorProtocol
    var disponseBag = DisposeBag()
    
    init(networkManager:  UserListInteractorProtocol) {
        self.networkManager = networkManager
    }
    
    func getUsers(type: String, controller: LoginViewController) {
        let response = networkManager.getUsers(type: type)
        response?.subscribe(onNext: { items in
            if items.count > 0 {
                self.navigateToUserView(items: response, controller: controller)
            } else {
                controller.upateView(status: false)
            }
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disponseBag)
        
        networkManager.isInternetAvailable.asObservable().subscribe { status in
            controller.upateView(status: status)
        }.disposed(by: disponseBag)
        
    }
    
    func navigateToUserView(items: Observable<[Items]>?, controller: LoginViewController) {
        Navigator.shared.navigateToUserView(items: items, controller: controller)
    }
}
