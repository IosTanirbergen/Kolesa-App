//
//  AuthorizationViewController.swift
//  Kolesa
//
//  Created by Dinmukhamed on 14.03.2023.
//

import UIKit

final class AuthorizationViewController: UIViewController {
//    private lazy var logoImageView: UIImageView = {
//        let img = UIImageView()
//        img.image = .init(named: "kolesa.logo")
//        return img
//    }()
    
    // MARK: - Properties
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        return tv
    }()
    
    private let viewModel = AuthorizationViewModel()
    
    override func loadView() {
        super.loadView()
        viewModel.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.register(KolesaLogoTableViewCell.self, forCellReuseIdentifier: KolesaLogoTableViewCell.description())
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        
        
        
        
//        viewModel.updateView = { [weak self] in
//            guard let self = self else {
//                return
//            }
//
//            self.tableView.reloadData()
//        }
    }
}

extension AuthorizationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let type = viewModel.state[indexPath.section].row[indexPath.row]
        
        let cell = KolesaLogoTableViewCell()
        cell.backgroundColor = .white
        return cell
//        switch type {
//        case .phoneNumber:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: KolesaLogoTableViewCell.description(), for: indexPath) as? KolesaLogoTableViewCell else {
//                return UITableViewCell()
//            }
//
//        case .password:
//        case .otp:
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 50
        case 1:
            return 60
        case 2:
            return 70
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
