//
//  KolesaLogoTableViewCell.swift
//  Kolesa
//
//  Created by Dinmukhamed on 14.03.2023.
//

import UIKit

final class KolesaLogoTableViewCell: UITableViewCell {
    override class func description() -> String {
        return "KolesaLogoTableViewCell"
    }
    
    private lazy var logoImageView: UIImageView = {
        let img = UIImageView()
        img.image = .init(named: "kolesa.logo")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(20)

            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
