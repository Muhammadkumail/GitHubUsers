//
//  BaseNavigationController.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 11/07/2022.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseNavigationController {
    
    func setupNavigation() {
        
        if #available(iOS 13.0, *) {
            
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = AppColors.navigationColor
            appearance.shadowImage = nil
            appearance.backgroundImage = nil
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            self.navigationBar.standardAppearance = appearance;
            self.navigationBar.scrollEdgeAppearance =
            self.navigationBar.standardAppearance
        } else {
            // Fallback on earlier versions
            self.navigationBar.barTintColor = AppColors.navigationColor
            self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            self.navigationBar.shadowImage = nil
            self.navigationBar.setBackgroundImage(nil, for: .default)
        }
        
    }
}
