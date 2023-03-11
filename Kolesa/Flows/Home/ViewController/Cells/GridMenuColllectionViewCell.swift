//
//  GridMenuColllectionViewCell.swift
//  ttt
//
//  Created by tanik on 09.03.2023.
//

import UIKit

final class GridMenuCollectionViewCell: UICollectionViewCell {
    
    override class func description() -> String {
        return "GridMenuCollectionViewCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
