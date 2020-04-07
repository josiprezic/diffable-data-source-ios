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
import Hero

final class WelcomeViewController: UIViewController {

    //
    // MARK: - Properties
    //
    
    let contentView = WelcomeView()
    let disposeBag = DisposeBag()
    let heroTransition = HeroTransition()
    
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
        
        // Hero animations
        navigationController?.delegate = self
        self.navigationController?.heroNavigationAnimationType = .autoReverse(presenting: .zoom)
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

// MARK: - Hero Animations setup
extension WelcomeViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning)
        -> UIViewControllerInteractiveTransitioning? {
        return heroTransition.navigationController(navigationController, interactionControllerFor: animationController)
    }

    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return heroTransition.navigationController(navigationController, animationControllerFor: operation, from: fromVC, to: toVC)
    }
}
