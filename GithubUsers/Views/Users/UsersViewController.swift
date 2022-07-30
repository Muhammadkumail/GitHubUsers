//
//  UsersViewController.swift
//  GithubUsers
//
//  Created by Kumail kashefi on 11/07/2022.
//

import UIKit
import RxCocoa
import RxSwift

class UsersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: UsersViewModel?
    var disposeBag = DisposeBag()
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func bindData() {
        
        viewModel?.getUsers()?.bind(to: tableView.rx.items(cellIdentifier: "itemCell", cellType: UsersTableViewCell.self)) {
            index , item , cell in
            cell.bindData(item: item)
        }.disposed(by: disposeBag)
        
        tableView.rx.didScroll.subscribe { [weak self] _ in
            guard let self = self else { return }
            let offSetY = self.tableView.contentOffset.y
            let contentHeight = self.tableView.contentSize.height

            if offSetY > (contentHeight - self.tableView.frame.size.height) {
                print("kumail")
            }
        }
        .disposed(by: disposeBag)
    }
}

extension UsersViewController {
   
    func setupViews() {
        setupNavigation()
        setupTableView()
        bindData()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "itemCell")
        tableView.rowHeight = 250
    }
    
    func setupNavigation() {
        self.title = Title.users.rawValue
        if let nav = self.navigationController as? BaseNavigationController {
            nav.setupNavigation()
        }
    }
}


