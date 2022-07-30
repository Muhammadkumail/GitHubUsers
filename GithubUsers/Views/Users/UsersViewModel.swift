//
//  ViewModel.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 12/07/2022.
//

import Foundation
import RxSwift


class UsersViewModel {
    
    private var items: Observable<[Items]>?
    
    init(items: Observable<[Items]>?) {
        self.items = items
    }
    
    func getUsers() -> Observable<[Items]>? {
        return items
    }
}
