//
//  PIViewControllerDelegates.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

extension PersonalInfoViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        var point = textField.frame.origin
        point.x = 0
        point.y = point.y - 200
        scrollView.setContentOffset(point, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
}

extension PersonalInfoViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        var point = textView.frame.origin
        point.x = 0
        point.y = point.y - 200
        scrollView.setContentOffset(point, animated: true)
    }
    
}

