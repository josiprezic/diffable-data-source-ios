//
//  LoadingTableViewCell.swift
//  diffable-data-source
//
//  Created by Josip Rezić on 07/04/2020.
//  Copyright © 2020 Josip Rezic. All rights reserved.
//

import UIKit

final class LoadingTableViewCell: UITableViewCell {
    
    let activityIndicatorView = UIActivityIndicatorView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        backgroundColor = .blue
        activityIndicatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
