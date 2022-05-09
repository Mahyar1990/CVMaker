//
//  BaseCollectionViewControllerDelegates.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

// MARK: - UICollectionView Delegate
extension BaseCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}


// MARK: - UICollectionView Delegate FlowLayout
extension BaseCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // height of every cell of the collectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 8, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
    }
    
}


// MARK: - Cell UITextField Delegates
extension BaseCollectionViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        var point = textField.frame.origin
        point.x = 0
        point.y = CGFloat(textField.tag * 266)
        myCollectionView.setContentOffset(point, animated: true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}

// MARK: - Cell UITextView Delegates
extension BaseCollectionViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        var point = textView.frame.origin
        point.x = 0
        point.y = CGFloat(textView.tag * 274)
        myCollectionView.setContentOffset(point, animated: true)
    }
}
