//
//  RequestManager.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 11/07/2022.
//
import Foundation
import Moya
import RxSwift

class RequestManager: NSObject {
    static let shared = RequestManager()
    fileprivate override init() {}
    private let provider = MoyaProvider<API>()
}

extension RequestManager {
    
    func execute<T: Decodable>(target: API) -> Observable<T> {
        return Observable.create { observer -> Disposable in
            
            self.provider.request(target) { result in
                switch result {
                case let .success(response):
                    do {
                        let results = try JSONDecoder().decode(T.self, from: response.data)
                        observer.onNext(results)
                        observer.onCompleted()
                    } catch _ {
                       break
                    }
                case .failure(_):
                   break
                }
            }
            
            return Disposables.create {
            }
        }
    }
    
}
