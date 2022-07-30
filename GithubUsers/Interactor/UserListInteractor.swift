//
//  CarsListInteractor.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 11/07/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol UserListInteractorProtocol {
    var isInternetAvailable: BehaviorRelay<Bool> { get set }
    func getUsers(type: String) -> Observable<[Items]>?
}

class UserListInteractor: UserListInteractorProtocol {
    
    var isInternetAvailable = BehaviorRelay<Bool>(value: false)
    private var userListNetworkService: UserListNetworkServiceProtocol?
    
    init(userListNetworkService: UserListNetworkServiceProtocol) {
        self.userListNetworkService = userListNetworkService
    }
    
    func getUsers(type: String) -> Observable<[Items]>? {
        
        if Reachability()?.isReachable ?? false {
            return getUserslistFromAPI(type)
        }
        
        throwAlert()
        return nil
    }
    
    func getUserslistFromAPI(_ type: String) -> Observable<[Items]>? {
        
        return userListNetworkService?.fetchSearchResult(type).flatMap{ users -> Observable<[Items]> in
            PublishSubject.just(Array(users.items?.sorted(by: { item1, item2 in
                return item1.login?.lowercased() ?? "" < item2.login?.lowercased() ?? ""
            }) ?? [Items]()))
        }
    }
}

extension UserListInteractor {
    
    func throwAlert()  {
        AlertService.sharedInstance.displayAlert(message: Alert.internetUnreachable.rawValue)
        isInternetAvailable.accept(false)
    }
}
