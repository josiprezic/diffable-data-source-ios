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

    let contentView = WelcomeView()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        title = String(describing: type(of: self))
        
        setupObservables()
    }
    
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
    
    private func handleTableButtonPressed() {
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
    
    private func handleCollectionButtonPressed() {
        navigationController?.pushViewController(CollectionViewController(), animated: true)
    }
}
