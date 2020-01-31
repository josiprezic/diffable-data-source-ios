//
//  CollectionViewCell.swift
//  diffable-data-source
//
//  Created by Josip Rezic on 31/01/2020.
//  Copyright © 2020 Josip Rezic. All rights reserved.
//

import SnapKit

final class CollectionViewCell: UICollectionViewCell {
    
    //
    // MARK: - Views
    //
    
    let textLabel = UILabel()
    
    //
    // MARK: - Initializers
    //
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
        setupStyling()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    // MARK: - Public methods
    //
    
    func configureCell(text: String) {
        textLabel.text = text
    }
    
    //
    // MARK: - Private methods
    //
    
    private func setupSubviews() {
        addSubview(textLabel)
    }
    
    private func setupConstraints() {
        textLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func setupStyling() {
        layer.cornerRadius = 5
        backgroundColor = .darkGray
        clipsToBounds = true
        
        textLabel.font = .systemFont(ofSize: 40)
        textLabel.textColor = .white
    }
}
