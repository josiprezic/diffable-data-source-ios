//
//  CollectionViewController.swift
//  diffable-data-source
//
//  Created by Josip Rezic on 31/01/2020.
//  Copyright © 2020 Josip Rezic. All rights reserved.
//

import UIKit

final class CollectionViewController: UICollectionViewController {
    
    //
    // MARK: - Enums
    //
    
    enum Section: CaseIterable {
        case main
    }
    
    //
    // MARK: - Properties
    //
    
    @available(iOS 13.0, *)
    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, RandomNumber>? = nil
    
    private var randomNumbersProvider = RandomNumbersProvider()
    private var randomizeButton: UIBarButtonItem?
    
    //
    // MARK: - Initializers
    //
    
    override init(collectionViewLayout layout: UICollectionViewLayout = UICollectionViewFlowLayout()) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    // MARK: - View methods
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomizeButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(handleRandomizeButtonPressed))
        setupUI()
        configureCollectionView()
        
        // Hero
        hero.isEnabled = true
        view.hero.id = "collectionHero"
        view.hero.modifiers = [.durationMatchLongest]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        populateCollectionView()
    }
    
    //
    // MARK: - Actions
    //
    
    @objc func handleRandomizeButtonPressed() {
        randomNumbersProvider.updateCurrentState()
        populateCollectionView()
    }
    
    //
    // MARK: - Private methods
    //
    
    private func setupUI() {
        title = String(describing: type(of: self))
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = randomizeButton
    }
    
    private func configureCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 2.0
        flowLayout.minimumLineSpacing = 3.0
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 5 - 5, height: 100)
        collectionView.collectionViewLayout = flowLayout
        
        collectionView.backgroundColor = .green
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
        collectionView.delegate = self
        setupCollectionViewDataSource()
    }
}

 //
 // MARK: - Extension - CollectionViewDelegate, CollectionViewDataSource methods
 //

 extension CollectionViewController {
    
     override func numberOfSections(in collectionView: UICollectionView) -> Int {
         return Section.allCases.count
     }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomNumbersProvider.currentState.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as? CollectionViewCell else {
            fatalError("Cannot create collection view cell.")
        }
        cell.textLabel.text = "\(self.randomNumbersProvider.currentState[indexPath.row].value)"
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
 }

 //
 // MARK: - Extension - DifferDataSource methods
 //

 extension CollectionViewController {
     
     private func setupCollectionViewDataSource() {
         if #available(iOS 13.0, *) {
            dataSource = .init(collectionView: collectionView, cellProvider: { [weak self] (collectionView, indexPath, item) -> UICollectionViewCell? in
                guard let self = self, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as? CollectionViewCell else {
                    fatalError("Cannot create collection view cell.")
                }
                cell.textLabel.text = "\(self.randomNumbersProvider.currentState[indexPath.row].value)"
                return cell
            })
         } else {
             collectionView.dataSource = self
         }
     }
     
     private func populateCollectionView() {
         if #available(iOS 13.0, *) {
             var snapshot = NSDiffableDataSourceSnapshot<Section, RandomNumber>()
             snapshot.appendSections(Section.allCases)
             snapshot.appendItems(randomNumbersProvider.currentState)
             dataSource?.apply(snapshot)
         } else {
             collectionView.reloadData()
         }
     }
 }
