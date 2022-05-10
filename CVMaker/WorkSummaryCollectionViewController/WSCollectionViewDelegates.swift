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
        cell.companyNameTextField.accessibilityValue = Constants.WorkSummary.companyName
        cell.durationTextField.tag = indexPath.item
        cell.durationTextField.accessibilityValue = Constants.WorkSummary.duration
        cell.descriptionTextView.tag = indexPath.item
        cell.descriptionTextView.accessibilityValue = Constants.WorkSummary.description
        
        return cell
    }
    
    @objc func removeItemFromCollectionView(sender: UIButton) {
        objectViewModels.remove(at: sender.tag)
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

extension WorkSummaryCollectionViewController {
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        if let txt = textField.text {
            switch textField.accessibilityValue {
            case Constants.WorkSummary.companyName:
                objectViewModels[textField.tag].companyName = txt
            case Constants.WorkSummary.duration:
                objectViewModels[textField.tag].duration = txt
            default: return
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if let txt = textView.text, textView.accessibilityValue == Constants.WorkSummary.description {
            objectViewModels[textView.tag].description = txt
        }
    }
}
