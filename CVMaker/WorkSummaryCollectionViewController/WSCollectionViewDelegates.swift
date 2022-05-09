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
        
        cell.companyNameTextField.delegate = self
        cell.durationTextField.delegate = self
        cell.descriptionTextView.delegate = self
        
        cell.companyNameTextField.tag = indexPath.item
        cell.durationTextField.tag = indexPath.item
        cell.descriptionTextView.tag = indexPath.item
        
        return cell
    }
    
    @objc func removeItemFromCollectionView(sender: UIButton) {
        if (objectViewModels.count != 1) {
            objectViewModels.remove(at: sender.tag)
        }
    }
}


// MARK: - UICollectionView Delegate FlowLayout
extension WorkSummaryCollectionViewController {
    //extension WorkSummaryCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // height of every cell of the collectionView
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 8, height: 254)
    }
    
}

