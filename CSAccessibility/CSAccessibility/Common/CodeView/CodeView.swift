//
//  CodeView.swift
//  ConcreteJobs
//
//  Created by andre.luiz.de.souza on 12/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import SnapKit

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() {}
}
