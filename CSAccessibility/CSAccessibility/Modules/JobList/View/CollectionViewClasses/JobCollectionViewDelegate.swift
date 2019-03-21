//
//  JobCollectionViewDelegate.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 18/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import UIKit

final class JobCollectionViewDelegate: NSObject {
    
    private let collectionViewPadding: CGFloat = 10
    private var presenter: JobListPresenterProtocol
    
    init(presenter: JobListPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension JobCollectionViewDelegate: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = presenter.jobList[indexPath.row]
        let colors = model.color(at: indexPath.row)
        presenter.view?.pushDetailViewController(with: model, colors: colors)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        
        var size: CGFloat = 0
        if UIDevice.current.orientation.isLandscape {
            size = (bounds.width - (3*collectionViewPadding))/2
        } else {
            size = bounds.width - (2*collectionViewPadding)
        }
        
        return CGSize(width: size, height: 1)
    }

    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2) {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2) {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.transform = CGAffineTransform.identity
        }
    }
    
}
