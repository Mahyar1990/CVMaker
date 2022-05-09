//
//  BaseCollectionViewLifeCycle.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

extension BaseCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.9, alpha: 0.9)
        
        setupNavigationBar()
        setupPageTitleStyle()
        setupCollectionView()
        setupView()
        setupKeyboardObservers()
    }
    
    func setupPageTitleStyle() {
        pageTitleLabel.setupMyCustomStyle(textColor: .darkGray, fontSize: 18, adjustFontSize: true)
        pageTitleLabel.textAlignment = .center
    }
    
    private func setupCollectionView() {
        myCollectionView.backgroundColor = UIColor(white: 0.9, alpha: 0.9)
        myCollectionView.delegate = self
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.myBoldSystemFont(ofSize: 16)]
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        createAddBarButton()
    }
    
    private func createAddBarButton() {
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save,
                                             target: self,
                                             action: #selector(saveButtonSelected))
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.compose,
                                            target:             self,
                                            action:             #selector(addButtonSelected))
        navigationItem.setRightBarButtonItems([saveButtonItem, addButtonItem], animated: true)
    }
    
    @objc func addButtonSelected() {
    }
    @objc func saveButtonSelected() {
    }
    
    func setupKeyboardObservers() {
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        let point = CGPoint(x: 0, y: 0)
        myCollectionView.setContentOffset(point, animated: true)
    }
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
