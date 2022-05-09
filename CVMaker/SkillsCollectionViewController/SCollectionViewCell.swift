//
//  SCollectionViewCell.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit


class SkillsCollectionViewCell: BaseCollectionViewCell {
    
    let skillTextField = TextField()
    let removeButton = UIButton()
    
    override func setupView() {
        super.setupView()
        
        setupObjectsStyles()
        setupViewLayout()
    }
    
    private func setupObjectsStyles() {
        setupTextBoxes(withTextField: skillTextField)
        
        removeButton.setupMyCustomStyle(contentMode: nil, fontSize: 14, fontColor: .white)
        let image = UIImage.MyCustomImages.Trash.withRenderingMode(.alwaysTemplate)
        removeButton.setImage(image, for: .normal)
        removeButton.tintColor = .systemRed
    }
    private func setupTextBoxes(withTextField tf: TextField) {
        tf.setupMyCustomStyle(textColor: .black, fontSize: 14, adjustFontSize: true)
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 4
    }
    
    private func setupViewLayout() {
        self.addSubview(skillTextField)
        self.addSubview(removeButton)
        
        removeButton.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -12).isActive = true
        removeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        removeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        removeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        skillTextField.topAnchor.constraint(equalTo: removeButton.topAnchor, constant: -4).isActive = true
        skillTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        skillTextField.rightAnchor.constraint(equalTo: removeButton.leftAnchor, constant: -24).isActive = true
        skillTextField.bottomAnchor.constraint(equalTo: removeButton.bottomAnchor,constant: 4).isActive = true
    }
    
}
