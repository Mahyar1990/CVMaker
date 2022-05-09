//
//  PIViewControllerMethods.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

extension PersonalInfoViewController {
    
    func showAlert(alertTitle:  String?,
                   alertMessage: String?,
                   okActionText: String?) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okActionText ?? "Done", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func editImageButtonDidSelected() {
        ImagePickerManager().pickImage(self) { [weak self] image in
            self?.userImageView.image = image
            self?.reloadInputViews()
        }
    }
    
    
    // MARK: - Keyboard methods
    @objc func keyboardWillHide(notification: NSNotification) {
        let point = CGPoint(x: 0, y: 0)
        scrollView.setContentOffset(point, animated: true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
