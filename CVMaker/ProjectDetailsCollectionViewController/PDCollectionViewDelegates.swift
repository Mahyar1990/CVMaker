//
//  PDCollectionViewDelegates.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

// MARK: - UICollectionView DataSource
extension ProjectDetailsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectViewModels.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProjectDetailCollectionViewCell
        cell.projectDetailsCellViewModel = objectViewModels[indexPath.item]
        cell.removeButton.tag = indexPath.item
        cell.removeButton.addTarget(self, action: #selector(removeItemFromCollectionView(sender:)), for: .touchUpInside)
        
        cell.projectNameTextField.delegate      = self
        cell.teamSizeTextField.delegate         = self
        cell.projectSummaryTextView.delegate    = self
        cell.usedTechnologiesTextField.delegate = self
        cell.roleTextField.delegate             = self
        
        cell.projectNameTextField.tag       = indexPath.item
        cell.teamSizeTextField.tag          = indexPath.item
        cell.projectSummaryTextView.tag     = indexPath.item
        cell.usedTechnologiesTextField.tag  = indexPath.item
        cell.roleTextField.tag              = indexPath.item
        
        return cell
    }
    
    @objc func removeItemFromCollectionView(sender: UIButton) {
        if (objectViewModels.count != 1) {
            objectViewModels.remove(at: sender.tag)
        }
    }
}


// MARK: - UICollectionView Delegate FlowLayout
extension ProjectDetailsCollectionViewController {
    //extension ProjectDetailsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // height of every cell of the collectionView
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 8, height: 278)
    }
    
}
