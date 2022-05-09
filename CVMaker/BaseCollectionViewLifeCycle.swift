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
        setupView()
    }
    
    func setupPageTitleStyle() {
        pageTitleLabel.setupMyCustomStyle(textColor: .darkGray, fontSize: 18, adjustFontSize: true)
        pageTitleLabel.textAlignment = .center
    }
    
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.myBoldSystemFont(ofSize: 16)]
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        //        navigationItem.title = Constants.Main.workSummary
        
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
    
}
