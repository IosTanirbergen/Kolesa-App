//
//  StoriesTableViewCell.swift
//  ttt
//
//  Created by tanik on 09.03.2023.
//

import UIKit

final class StoriesTableViewCell: UITableViewCell {
    
    override class func description() -> String {
        "StoriesTableViewCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
