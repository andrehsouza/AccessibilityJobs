//
//  JobListViewController.swift
//  ConcreteJobs
//
//  Created by andre.luiz.de.souza on 12/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import UIKit

final class JobListViewController: UIViewController {
    
    private let jobListScreenView = JobListScreenView()
    
    private var delegate: JobCollectionViewDelegate
    private var dataSource: JobCollectionViewDataSource
    private let presenter: JobListPresenterProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar(with: .default, prefersLargeTitles: true)
    }
    
    init(presenter: JobListPresenterProtocol = JobListPresenter()) {
        self.presenter = presenter
        delegate = JobCollectionViewDelegate(presenter: presenter)
        dataSource = JobCollectionViewDataSource(presenter: presenter)
        super.init(nibName: nil, bundle: nil)
        self.presenter.attachView(view: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = jobListScreenView
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        jobListScreenView.refreshLayout()
    }

}

// MARK: Funcs

private extension JobListViewController {
    
    func initialSetup() {
        title = L10n.jobListScreenTitle
        setupNavigationBar(with: .default, prefersLargeTitles: true)
        setupCollectionView()
        presenter.viewDidLoad()
    }
    
    func setupCollectionView() {
        jobListScreenView.registerCell(JobCell.self)
        jobListScreenView.setCollectionViewDelegate(delegate)
        jobListScreenView.setCollectionViewDataSource(dataSource)
    }
    
    func postAccessibilityNotification(with message: String) {
        UIAccessibility.post(notification: .layoutChanged, argument: message)
    }
    
}

extension JobListViewController: JobListViewProtocol {
    
    func pushDetailViewController(with job: JobModel, colors: JobColor) {
        let viewController = JobDetailViewController(with: job, colors: colors)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showLoading(_ show: Bool) {
        if show {
            postAccessibilityNotification(with: L10n.jobListLoading)
        }
        jobListScreenView.showLoading(show)
    }
    
    func showError(with errorModel: GenericErrorModel) {
        jobListScreenView.showErrorView(with: errorModel)
    }
    
    func hideError() {
        jobListScreenView.hideErrorView()
    }
    
    func showJobList(_ show: Bool) {
        jobListScreenView.showCollectionView(show)
    }
    
    func reloadData() {
        postAccessibilityNotification(with: L10n.jobListLoadingComplete)
        jobListScreenView.reloadData()
    }
    
}


