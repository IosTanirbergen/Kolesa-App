//
//  HomeHeaderView.swift
//  ttt
//
//  Created by tanik on 09.03.2023.
//

import UIKit
import SnapKit

final class HomeHeaderView: UIView {
    private lazy var leftTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Kolesa.kz"
        return lb
    }()
    
    private lazy var rightNewsLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Новости"
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        configureView()
    }
    
    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .green
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupConstraints() {
        [leftTitleLabel, rightNewsLabel].forEach {
            addSubview($0)
        }
        
        leftTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16.0)
        }
        
        rightNewsLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
