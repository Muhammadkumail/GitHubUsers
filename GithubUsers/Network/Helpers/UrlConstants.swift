//
//  UrlConstants.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 11/07/2022.
//

import Moya

enum API {
    case search(query: String)
}

extension API: TargetType {
    
    // This is the base URL we'll be using, typically our server.
    var baseURL: URL {
        guard let url = URL(string: "https://api.github.com/") else { fatalError() }
        return url
    }
    
    // This is the path of each operation that will be appended to our base URL.
    var path: String {
        switch self {
        case .search:
            return "search/users"
        }
    }
    
    // Here we specify which method our calls should use.
    var method: Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    // Here we specify body parameters, objects, files etc.
    var task: Task {
        switch self {

        case .search(let query):
            return .requestParameters(parameters: ["q" : query], encoding: URLEncoding.queryString)
        }
    }
    
    // These are the headers that our service requires.
    var headers: [String : String]? {
        return nil
    }
    
    // This is sample return data that you can use to mock and test your services,
    var sampleData: Data {
        return Data()
    }
}
