//
//  JobCollectionViewDataSource.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 18/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import UIKit

final class JobCollectionViewDataSource: NSObject {
    
    private var presenter: JobListPresenterProtocol
    
    init(presenter: JobListPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension JobCollectionViewDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.jobList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let job = presenter.jobList[indexPath.item]
        let mainColor = job.color(at: indexPath.row).mainColor
        let cell = collectionView.dequeueReusableCell(JobCell.self, for: indexPath)
        cell.setup(with: job)
        cell.setupRowColor(with: mainColor)
        return cell
    }
    
}
