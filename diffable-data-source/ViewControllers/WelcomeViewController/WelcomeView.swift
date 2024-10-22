//
//  WelcomeView.swift
//  diffable-data-source
//
//  Created by Josip Rezic on 31/01/2020.
//  Copyright © 2020 Josip Rezic. All rights reserved.
//

import SnapKit

final class WelcomeView: UIView {
    
    //
    // MARK: - Views
    //
    
    let tableButton = UIButton()
    let collectionButton = UIButton()
    
    //
    // MARK: - Initializers
    //
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
        setupStyling()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    // MARK: - Private methods
    //
    
    private func setupSubviews() {
        [tableButton, collectionButton].forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        
        tableButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(snp.centerYWithinMargins).inset(20)
        }
        
        collectionButton.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview().inset(20)
            make.top.equalTo(snp.centerYWithinMargins).offset(20)
        }
    }
    
    private func setupStyling() {
        backgroundColor = .white
        
        tableButton.setTitle("Table", for: .normal)
        collectionButton.setTitle("Collection", for: .normal)
        
        [tableButton, collectionButton].forEach {
            $0.backgroundColor = .lightGray
            $0.tintColor = .black
        }
    }
}
