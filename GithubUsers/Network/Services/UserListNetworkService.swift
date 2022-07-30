//
//  UserListNetworkService.swift
//  Cars
//
//  Created by Kumail kashefi on 10/06/2022.
//

import Foundation
import Moya
import RxSwift

protocol UserListNetworkServiceProtocol {
    func fetchSearchResult(_ query: String) -> Observable<Users>
}

class UserListNetworkService: UserListNetworkServiceProtocol {

    func fetchSearchResult(_ query: String) -> Observable<Users> {
        return RequestManager.shared.execute(target: .search(query: query))
    }
}
