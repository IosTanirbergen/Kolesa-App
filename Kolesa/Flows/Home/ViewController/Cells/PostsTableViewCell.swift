//
//  PostsTableViewCell.swift
//  ttt
//
//  Created by tanik on 09.03.2023.
//

import UIKit

final class PostsTableViewCell: UITableViewCell {
    
    override class func description() -> String {
        "PostsTableViewCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .brown.withAlphaComponent(0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

