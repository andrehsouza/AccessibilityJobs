//
//  JobCell.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 18/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import UIKit

final class JobCell: UICollectionViewCell {
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    private let containerView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 10.0
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 5.0
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        return view
    }()
    
    private let icon: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        
        // Accessibility
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.numberOfLines = 4
        label.lineBreakMode = .byWordWrapping
        
        // Accessibility
        label.font = .preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        
        // Accessibility
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let colorView: UIView = {
        let view = UIView(frame: .zero)
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        view.layer.cornerRadius = 10.0
        return view
    }()
    
    // MARK: Inits
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }

}

extension JobCell {
    
    func setup(with job: JobModel) {
        icon.image = job.icon
        applyAccessibility(with: job)
        titleLabel.hyphenText(job.title)
        locationLabel.hyphenText(job.location.capitalized)
    }
    
    func setupRowColor(with color: UIColor) {
        colorView.backgroundColor = color
    }
    
    // Accessibility
    private func applyAccessibility(with job: JobModel){
        isAccessibilityElement = true
        accessibilityTraits = .button
        accessibilityLabel = "\(job.title). \(L10n.jobLocation): \(job.location)"
        accessibilityHint = L10n.jobCellHint
    }
    
}

extension JobCell: CodeView {
    
    func buildViewHierarchy() {
        containerView.addSubview(icon)
        containerView.addSubview(colorView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(locationLabel)
        contentView.addSubview(containerView)
    }
    
    func setupConstraints() {
        
        self.containerView.snp.makeConstraints { maker in
            maker.edges.equalTo(contentView)
        }

        self.colorView.snp.makeConstraints { maker in
            maker.top.equalTo(containerView)
            maker.bottom.left.equalTo(containerView)
            maker.width.equalTo(10)
        }

        self.icon.snp.makeConstraints { maker in
            maker.top.equalTo(containerView).offset(15)
            maker.left.equalTo(containerView).inset(30)
        }

        self.titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(icon.snp.bottom).offset(10)
            maker.right.equalTo(containerView).inset(15)
            maker.left.equalTo(containerView).inset(30)
        }

        self.locationLabel.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(10)
            maker.right.equalTo(containerView).inset(15)
            maker.bottom.equalTo(containerView).inset(15)
            maker.left.equalTo(containerView).inset(30)
        }
        
    }
    
}
