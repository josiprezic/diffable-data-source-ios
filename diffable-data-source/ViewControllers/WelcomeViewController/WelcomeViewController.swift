//
//  WelcomeViewController.swift
//  diffable-data-source
//
//  Created by Josip Rezic on 31/01/2020.
//  Copyright © 2020 Josip Rezic. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class WelcomeViewController: UIViewController {

    //
    // MARK: - Properties
    //
    
    let contentView = WelcomeView()
    let disposeBag = DisposeBag()
    
    //
    // MARK: - View methods
    //
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        title = String(describing: type(of: self))
        
        setupObservables()
    }
    
    //
    // MARK: - Actions
    //
    
    private func handleTableButtonPressed() {
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
    
    private func handleCollectionButtonPressed() {
        navigationController?.pushViewController(CollectionViewController(), animated: true)
    }
    
    //
    // MARK: - Private methods
    //
    
    private func setupObservables() {
        contentView.tableButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.handleTableButtonPressed()
            })
        .disposed(by: disposeBag)
        
        contentView.collectionButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.handleCollectionButtonPressed()
            })
        .disposed(by: disposeBag)
    }
}
