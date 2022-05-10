//
//  MViewControllerView.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

extension MainViewController {
    
    func setupView() {
        setupObjectsStyles()
        setupViewLayouts()
    }
    
    // MARK: - setup Objects Styles
    private func setupObjectsStyles() {
        setupButton(button: createButton, withName: Constants.Main.createCV, withSelector: #selector(createButtonDidSelected))
//        setupButton(button: editButton, withName: Constants.Main.editCV, withSelector: #selector(editButtonDidSelected))
    }
    
    private func setupButton(button: UIButton, withName: String, withSelector: Selector) {
        button.setupMyCustomStyle()
        button.backgroundColor = UIColor.systemBlue
        button.setTitle(withName, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 22
        button.addTarget(self,
                         action: withSelector,
                         for:   .touchUpInside)
    }
    
    // MARK: - setup View Layouts
    private func setupViewLayouts() {
        createButtonToView()
//        editButtonToView()
    }
    
    private func createButtonToView() {
        view.addSubview(createButton)
        createButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -24).isActive = true
        createButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        createButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
//    private func editButtonToView() {
//        view.addSubview(editButton)
//        editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 24).isActive = true
//        editButton.leftAnchor.constraint(equalTo: createButton.leftAnchor).isActive = true
//        editButton.rightAnchor.constraint(equalTo: createButton.rightAnchor).isActive = true
//        editButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
//    }
    
}
