//
//  GenericErrorView.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 18/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import UIKit

final class GenericErrorView: UIView {
    
    var model: GenericErrorModel? {
        didSet {
            errorImage.image = model?.image
            errorImage.tintColor = model?.imageColor
            errorMessage.text = model?.message
        }
    }
    
    private lazy var errorImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var errorMessage: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        label.textColor = .black
        label.accessibilityHint = model?.message
        label.numberOfLines = 0
        return label
    }()
    
    private let errorStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GenericErrorView: CodeView {
    func buildViewHierarchy() {
        errorStackView.addArrangedSubview(errorImage)
        errorStackView.addArrangedSubview(errorMessage)
        addSubview(errorStackView)
    }
    
    func setupConstraints() {
        
        errorImage.snp.makeConstraints { maker in
            maker.height.equalTo(80)
        }
        
        errorStackView.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.left.equalTo(10)
            maker.right.equalTo(-10)
        }
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .clear
    }
}
