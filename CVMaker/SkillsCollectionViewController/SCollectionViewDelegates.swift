//
//  SCollectionViewDelegates.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

// MARK: - UICollectionViewDelegates implementation
extension SkillsCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skillItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SkillsCollectionViewCell
        
        cell.skillTextField.text = skillItems[indexPath.item]
        cell.skillTextField.delegate = self
        cell.skillTextField.tag = indexPath.item
        cell.removeButton.tag = indexPath.item
        cell.removeButton.addTarget(self, action: #selector(removeItemFromTableView(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func removeItemFromTableView(sender: UIButton) {
        skillItems.remove(at: sender.tag)
    }
    
}


// MARK: - UICollectionView Delegate FlowLayout
extension SkillsCollectionViewController {
    //extension SkillsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // height of every cell of the collectionView
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 8, height: 48)
    }
    
}


extension SkillsCollectionViewController {
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        if let txt = textField.text {
            skillItems[textField.tag] = txt
        }
    }
    
}
