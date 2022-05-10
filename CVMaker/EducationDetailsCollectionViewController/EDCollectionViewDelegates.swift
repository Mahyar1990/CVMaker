//
//  EDCollectionViewDelegates.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

// MARK: - UICollectionView DataSource
extension EducationDetailsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectViewModels.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EducationDetailCollectionViewCell
        cell.educationDetailsCellViewModel = objectViewModels[indexPath.item]
        cell.removeButton.tag = indexPath.item
        cell.removeButton.addTarget(self, action: #selector(removeItemFromCollectionView(sender:)), for: .touchUpInside)
        
        cell.classTextField.delegate = self
        cell.classTextField.accessibilityValue = Constants.EducationDetail.className
        cell.passingYearTextField.delegate = self
        cell.passingYearTextField.accessibilityValue = Constants.EducationDetail.passingYear
        cell.percentageTextField.delegate = self
        cell.percentageTextField.accessibilityValue = Constants.EducationDetail.percentage
        
        cell.classTextField.tag = indexPath.item
        cell.passingYearTextField.tag = indexPath.item
        cell.percentageTextField.tag = indexPath.item
        
        return cell
    }
    
    @objc func removeItemFromCollectionView(sender: UIButton) {
        objectViewModels.remove(at: sender.tag)
    }
}


// MARK: - UICollectionView Delegate FlowLayout
extension EducationDetailsCollectionViewController {
    //extension EducationDetailsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // height of every cell of the collectionView
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 8, height: 164)
    }
    
}



extension EducationDetailsCollectionViewController {
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        if let txt = textField.text {
            switch textField.accessibilityValue {
            case Constants.EducationDetail.className:
                objectViewModels[textField.tag].className = txt
            case Constants.EducationDetail.passingYear:
                objectViewModels[textField.tag].passingYear = txt
            case Constants.EducationDetail.percentage:
                objectViewModels[textField.tag].percentage = txt
            default: return
            }
        }
    }
    
}
