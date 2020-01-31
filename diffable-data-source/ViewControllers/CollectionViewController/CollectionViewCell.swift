//
//  CollectionViewCell.swift
//  diffable-data-source
//
//  Created by Josip Rezic on 31/01/2020.
//  Copyright © 2020 Josip Rezic. All rights reserved.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
        setupStyling()
    }
    
    private func setupSubviews() {
        addSubview(textLabel)
    }
    
    private func setupConstraints() {
        textLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private final func setupStyling() {
        layer.cornerRadius = 5
        clipsToBounds = true
        backgroundColor = .darkGray
        
        textLabel.font = .systemFont(ofSize: 40)
        textLabel.textColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final func configureCell(text: String) {
        textLabel.text = text
    }
}
