//
//  JobListScreenView.swift
//  ConcreteJobs
//
//  Created by andre.luiz.de.souza on 12/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import UIKit

final class JobListScreenView: UIView {
    
   private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let collectionViewPadding: CGFloat = 10
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.sectionInset = UIEdgeInsets(top: collectionViewPadding,
                                                         left: collectionViewPadding,
                                                         bottom: collectionViewPadding,
                                                         right: collectionViewPadding)
    
        collectionViewLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        return collectionViewLayout
    }()
   
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: .zero)
        activityIndicator.style = .whiteLarge
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = Asset.Colors.blueBerry.color
        return activityIndicator
    }()
    
    private let genericView: GenericErrorView = {
        let view = GenericErrorView()
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension JobListScreenView {
    
    func registerCell<T: UICollectionViewCell>(_ cellType: T.Type) {
        collectionView.register(cellType, forCellWithReuseIdentifier: cellType.identifier)
    }
    
    func setCollectionViewDelegate(_ delegate: UICollectionViewDelegate) {
        collectionView.delegate = delegate
    }
    
    func setCollectionViewDataSource(_ dataSource: UICollectionViewDataSource) {
        collectionView.dataSource = dataSource
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func showCollectionView(_ show: Bool) {
        collectionView.isHidden = !show
    }
    
    func showErrorView(with model: GenericErrorModel) {
        genericView.model = model
        genericView.isHidden = false
    }
    
    func hideErrorView() {
        genericView.isHidden = true
    }
    
    func showLoading(_ show: Bool) {
        if show {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func refreshLayout() {
        collectionViewLayout.invalidateLayout()
    }

}

extension JobListScreenView: CodeView {
    
    func buildViewHierarchy() {
        addSubview(activityIndicator)
        addSubview(collectionView)
        addSubview(genericView)
    }
    
    func setupConstraints() {
        
        collectionView.snp.makeConstraints { maker in
            maker.edges.equalTo(safeAreaLayoutGuide)
        }
        
        activityIndicator.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
        }
        
        genericView.snp.makeConstraints { maker in
            maker.edges.equalTo(safeAreaLayoutGuide)
        }
        
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}
