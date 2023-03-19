//
//  AuthorizationViewController.swift
//  Kolesa
//
//  Created by Dinmukhamed on 14.03.2023.
//

import UIKit

final class AuthorizationViewController: UIViewController {

    // MARK: - Properties
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = .white
        tv.isScrollEnabled = false
        return tv
    }()
    
    private let viewModel = AuthorizationViewModel()
    
    override func loadView() {
        super.loadView()
        viewModel.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup() {
        bindViewModel()
        setupViews()
        setupTableView()
        makeConstraints()
        
    }
    private func bindViewModel() {
        viewModel.updateView = { [weak self] in
            guard let self = self else {
                return
            }

            self.tableView.reloadData()
        }
    }
    private func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubviews([tableView])
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: DefaultTableViewCell.description())
        tableView.register(UserDefaultTableViewCell.self, forCellReuseIdentifier: UserDefaultTableViewCell.description())
    }
}

extension AuthorizationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = viewModel.state
    
        switch type {
        case .defaultState:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.description(), for: indexPath) as? DefaultTableViewCell else { return UITableViewCell() }
            cell.nextButton.addTarget(self, action: #selector(checkState), for: .touchUpInside)
            return cell

        case .defaultUser:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserDefaultTableViewCell.description(), for: indexPath) as?
                    UserDefaultTableViewCell else { return UITableViewCell() }
            cell.phoneNumberTextField.addTarget(self, action: #selector(changeState), for: .allEditingEvents)
            return cell
        case .none:
            print("none")
        case .newUser:
            print("newUser")
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    @objc func checkState() {
        viewModel.updateState(state: .defaultUser)
    }
    @objc func changeState() {
        viewModel.updateState(state: .defaultState)
    }
}

