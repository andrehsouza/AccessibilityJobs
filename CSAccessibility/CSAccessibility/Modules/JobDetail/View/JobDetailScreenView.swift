//
//  JobDetailScreen.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 22/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import UIKit

final class JobDetailScreen: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .clear
        scrollView.scrollIndicatorInsets = self.safeAreaInsets
        return scrollView
    }()
    
    private let headerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = Asset.Colors.spaceGray.color
        view.isAccessibilityElement = false
        return view
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: safeAreaInsets.left, bottom: 0, right: safeAreaInsets.right)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let waveImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.image = Asset.Images.icWaves.image
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        
        //Accessibility
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        
        //Accessibility
        label.accessibilityLanguage = "pt_BR"
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var bodyView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        
        //Accessibility
        label.accessibilityLanguage = "pt_BR"
        label.accessibilityTraits = .staticText
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension JobDetailScreen {
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setDescription(_ description: String) {
        descriptionLabel.text = description.htmlToString
    }
    
    func setLocation(_ local: String) {
        locationLabel.text = local
    }
    
    func setHeaderColors(_ colors: JobColor) {
        headerView.backgroundColor = colors.mainColor
        titleLabel.textColor = colors.contrastColor
        locationLabel.textColor = colors.contrastColor
        waveImage.tintColor = colors.contrastColor
    }
    
}

extension JobDetailScreen: CodeView {
    
    func buildViewHierarchy() {
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(locationLabel)
        headerView.addSubview(headerStackView)
        headerView.addSubview(waveImage)
        bodyView.addSubview(descriptionLabel)
        scrollView.addSubview(headerView)
        scrollView.addSubview(bodyView)
        addSubview(scrollView)
    }
    
    func setupConstraints() {
        
        scrollView.snp.makeConstraints { maker in
            maker.top.left.right.equalTo(self)
            maker.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        headerView.snp.makeConstraints { maker in
            maker.top.equalTo(self).priority(.high)
            maker.left.right.equalTo(self)
            maker.height.greaterThanOrEqualTo(250).priority(.required)
            maker.bottom.equalTo(bodyView.snp.top)
        }
        
        headerStackView.snp.makeConstraints { maker in
            maker.top.greaterThanOrEqualToSuperview().offset(15)
            maker.left.equalToSuperview().offset(15)
            maker.right.bottom.equalToSuperview().inset(15)
        }
        
        waveImage.snp.makeConstraints { maker in
            maker.left.right.top.equalTo(headerView)
            maker.bottom.equalTo(headerStackView.snp.top).offset(-10)
        }
        
        bodyView.snp.makeConstraints { maker in
            maker.top.equalTo(scrollView).offset(265)
            maker.left.right.equalTo(self)
            maker.bottom.equalTo(scrollView)
        }
        
        descriptionLabel.snp.makeConstraints { maker in
            maker.left.equalTo(safeAreaLayoutGuide).offset(15)
            maker.right.equalTo(safeAreaLayoutGuide).inset(15)
            maker.top.equalToSuperview().offset(15)
            maker.bottom.equalToSuperview()
        }
        
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}
