//
//  WSCollectionViewDelegates.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

// MARK: - UICollectionView DataSource
extension WorkSummaryCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectViewModels.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WorkSummaryCollectionViewCell
        cell.workSummaryCellViewModel = objectViewModels[indexPath.item]
        cell.removeButton.tag = indexPath.item
        cell.removeButton.addTarget(self, action: #selector(removeItemFromCollectionView(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func removeItemFromCollectionView(sender: UIButton) {
        if (objectViewModels.count != 1) {
            objectViewModels.remove(at: sender.tag)
        }
    }
}
