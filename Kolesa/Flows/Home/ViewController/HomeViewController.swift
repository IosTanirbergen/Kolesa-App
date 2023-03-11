//
//  HomeViewController.swift
//  Kolesa
//
//  Created by tanik on 11.03.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let headerView = HomeHeaderView()
    
    private lazy var homeTableView: UITableView = {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupConstraints()
        registerTableViewCells()
    }
    
    private func setupConstraints() {
        [headerView, homeTableView].forEach {
            view.addSubview($0)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
        homeTableView.snp.makeConstraints {
            $0.top.equalTo(headerView.safeAreaLayoutGuide.snp.bottom).inset(4.0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func registerTableViewCells() {
        [StoriesTableViewCell.self, GridMenuTableViewCell.self, PostsTableViewCell.self].forEach {
            homeTableView.register($0, forCellReuseIdentifier: $0.description())
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let storiesCell = tableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.description(), for: indexPath) as? StoriesTableViewCell
            else {
               return UITableViewCell()
            }
            
            return storiesCell
        case 1:
            guard let gridCell = tableView.dequeueReusableCell(withIdentifier: GridMenuTableViewCell.description(), for: indexPath) as? GridMenuTableViewCell
            else {
               return UITableViewCell()
            }
            
            return gridCell
        case 2:
            guard let postCell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.description(), for: indexPath) as? PostsTableViewCell
            else {
                return UITableViewCell()
            }
            
            return postCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 146.0
        case 1:
            return UIScreen.main.bounds.size.width / 2 + 18
        case 2:
            return 1000.0
        default:
            return 0.0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
