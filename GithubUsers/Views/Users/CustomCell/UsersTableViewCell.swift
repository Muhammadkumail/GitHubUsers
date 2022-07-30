//
//  UsersTableViewCell.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 12/07/2022.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var UserType: UILabel!
    @IBOutlet weak var loginUser: UILabel!
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(item: Items)  {
        UserType.text = item.type
        loginUser.text = item.login
        UIImageView().setImage(urlString: item.avatar_url, imageView: avatarImg)
    }
    
}
