//
//  JobDetailViewController.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 22/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import UIKit

final class JobDetailViewController: UIViewController {
    
    private let presenter: JobDetailPresenterProtocol
    private let jobDetailScreenView = JobDetailScreen()
    private let colors: JobColor
    
    init(with job: JobModel, colors: JobColor) {
        presenter = JobDetailPresenter(with: job)
        self.colors = colors
        super.init(nibName: nil, bundle: nil)
        presenter.attachView(view: self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateStatusBar() 
        setupNavigationBar(with: .colored(barColor: colors.mainColor, tintColor: colors.contrastColor))
    }
    
    override func willMove(toParent parent: UIViewController?) {
        setupNavigationBar(with: .default, prefersLargeTitles: true)
        super.willMove(toParent: parent)
    }

    override func loadView() {
        self.view = jobDetailScreenView
    }
    
}

// Funcs

private extension JobDetailViewController {
    
    func initialSetup() {
        title = L10n.jobDetailScreenTitle
        presenter.viewDidLoad()
        jobDetailScreenView.setHeaderColors(colors)
    }
    
    func updateStatusBar() {
        if colors.contrastColor == .black {
            navigationController?.navigationBar.barStyle = .default
        } else {
            navigationController?.navigationBar.barStyle = .black
        }
    }
    
}

extension JobDetailViewController: JobDetailViewProtocol {
    
    func setJobTitle(_ title: String) {
        jobDetailScreenView.setTitle(title)
    }
    
    func setJobDescription(_ description: String) {
        jobDetailScreenView.setDescription(description)
    }
    
    func setJobLocation(_ local: String) {
        jobDetailScreenView.setLocation(local)
    }
    
}
