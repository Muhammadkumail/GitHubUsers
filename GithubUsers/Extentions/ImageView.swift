//
//  ImageView.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 11/07/2022.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImage(urlString: String?,imageView: UIImageView) {
        
        if let url = URL.init(string: urlString ?? "")  {
            getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() {
                    imageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
