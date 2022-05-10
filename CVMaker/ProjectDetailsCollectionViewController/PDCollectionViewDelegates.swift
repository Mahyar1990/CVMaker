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
        cell.projectNameTextField.accessibilityValue = Constants.ProjectDetail.projectName
        cell.teamSizeTextField.delegate         = self
        cell.teamSizeTextField.accessibilityValue = Constants.ProjectDetail.teamSize
        cell.projectSummaryTextView.delegate    = self
        cell.projectSummaryTextView.accessibilityValue = Constants.ProjectDetail.projectSummary
        cell.usedTechnologiesTextField.delegate = self
        cell.usedTechnologiesTextField.accessibilityValue = Constants.ProjectDetail.usedTechnologies
        cell.roleTextField.delegate             = self
        cell.roleTextField.accessibilityValue = Constants.ProjectDetail.role
        
        cell.projectNameTextField.tag       = indexPath.item
        cell.teamSizeTextField.tag          = indexPath.item
        cell.projectSummaryTextView.tag     = indexPath.item
        cell.usedTechnologiesTextField.tag  = indexPath.item
        cell.roleTextField.tag              = indexPath.item
        
        return cell
    }
    
    @objc func removeItemFromCollectionView(sender: UIButton) {
        objectViewModels.remove(at: sender.tag)
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


extension ProjectDetailsCollectionViewController {
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        if let txt = textField.text {
            switch textField.accessibilityValue {
            case Constants.ProjectDetail.projectName:
                objectViewModels[textField.tag].projectName = txt
            case Constants.ProjectDetail.teamSize:
                objectViewModels[textField.tag].teamSize = txt
            case Constants.ProjectDetail.usedTechnologies:
                objectViewModels[textField.tag].usedTechnologies = txt
            case Constants.ProjectDetail.role:
                objectViewModels[textField.tag].role = txt
            default: return
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if let txt = textView.text, textView.accessibilityValue == Constants.ProjectDetail.projectSummary {
            objectViewModels[textView.tag].projectSummary = txt
        }
    }
    
}
