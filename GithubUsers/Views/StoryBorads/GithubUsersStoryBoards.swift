//
//  GithubUsersStoryBoards.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 11/07/2022.

import Foundation
import UIKit


enum GithubUsersStoryBoards : String {
    case Main
  
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController> (viewControllerClass: T.Type) -> T {
        let storyboardID  = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromGithubUsersStoryBoards githubUsersStoryBoards : GithubUsersStoryBoards) -> Self {
        return githubUsersStoryBoards.viewController(viewControllerClass: self)
    }
}
