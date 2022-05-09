//
//  EDCollectionViewCell.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

class EducationDetailCollectionViewCell: BaseCollectionViewCell {
    
    let classLabel = UILabel()
    let classTextField = TextField()
    
    let passingYearLabel = UILabel()
    let passingYearTextField = TextField()
    
    let percentageLabel = UILabel()
    let percentageTextField = TextField()
    
    let removeButton = UIButton()
    
    var educationDetailsCellViewModel: EducationDetailCellViewModel! {
        didSet {
            if let name = educationDetailsCellViewModel.className {
                classTextField.text = name
            }
            if let duration = educationDetailsCellViewModel.passingYear {
                passingYearTextField.text =  duration
            }
            if let description = educationDetailsCellViewModel.percentage {
                percentageTextField.text = description
            }
        }
    }
    
    override func setupView() {
        super.setupView()
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 0.5
        setupObjectsStyles()
        setupViewLayout()
    }
    
    
    private func setupObjectsStyles() {
        classLabel.setupMyCustomStyle(textColor: .gray, fontSize: 14, adjustFontSize: true)
        passingYearLabel.setupMyCustomStyle(textColor: .gray, fontSize: 14, adjustFontSize: true)
        percentageLabel.setupMyCustomStyle(textColor: .gray, fontSize: 14, adjustFontSize: true)
        
        classLabel.text         = Constants.EducationDetail.className
        passingYearLabel.text   = Constants.EducationDetail.passingYear
        percentageLabel.text    = Constants.EducationDetail.percentage
        
        setupTextBoxes(withTextField: classTextField)
        setupTextBoxes(withTextField: passingYearTextField)
        setupTextBoxes(withTextField: percentageTextField)
        
        removeButton.setupMyCustomStyle(contentMode: nil, fontSize: 14, fontColor: .white)
        let image = UIImage.MyCustomImages.Trash.withRenderingMode(.alwaysTemplate)
        removeButton.setImage(image, for: .normal)
        removeButton.tintColor = .systemRed
        removeButton.layer.cornerRadius = 16
    }
    private func setupTextBoxes(withTextField tf: TextField) {
        tf.setupMyCustomStyle(textColor: .black, fontSize: 14, adjustFontSize: true)
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 4
    }
    
    private func setupViewLayout() {
        self.addSubview(classLabel)
        self.addSubview(classTextField)
        
        self.addSubview(passingYearLabel)
        self.addSubview(passingYearTextField)
        
        self.addSubview(percentageLabel)
        self.addSubview(percentageTextField)
        
        self.addSubview(removeButton)
        
        classLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        classLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        classLabel.rightAnchor.constraint(equalTo: self.centerXAnchor, constant: -44).isActive = true
        classLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        classTextField.topAnchor.constraint(equalTo: classLabel.topAnchor).isActive = true
        classTextField.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: -32).isActive = true
        classTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        classTextField.bottomAnchor.constraint(equalTo: classLabel.bottomAnchor).isActive = true
        
        passingYearLabel.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 8).isActive = true
        passingYearLabel.leftAnchor.constraint(equalTo: classLabel.leftAnchor).isActive = true
        passingYearLabel.rightAnchor.constraint(equalTo: classLabel.rightAnchor).isActive = true
        passingYearLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        passingYearTextField.topAnchor.constraint(equalTo: passingYearLabel.topAnchor).isActive = true
        passingYearTextField.leftAnchor.constraint(equalTo: classTextField.leftAnchor).isActive = true
        passingYearTextField.rightAnchor.constraint(equalTo: classTextField.rightAnchor).isActive = true
        passingYearTextField.bottomAnchor.constraint(equalTo: passingYearLabel.bottomAnchor).isActive = true
        
        percentageLabel.topAnchor.constraint(equalTo: passingYearLabel.bottomAnchor, constant: 8).isActive = true
        percentageLabel.leftAnchor.constraint(equalTo: classLabel.leftAnchor).isActive = true
        percentageLabel.rightAnchor.constraint(equalTo: classLabel.rightAnchor).isActive = true
        percentageLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        percentageTextField.topAnchor.constraint(equalTo: percentageLabel.topAnchor).isActive = true
        percentageTextField.leftAnchor.constraint(equalTo: classTextField.leftAnchor).isActive = true
        percentageTextField.rightAnchor.constraint(equalTo: classTextField.rightAnchor).isActive = true
        percentageTextField.bottomAnchor.constraint(equalTo: percentageLabel.bottomAnchor).isActive = true
        
        removeButton.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor, constant: 24).isActive = true
        removeButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        removeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        removeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
}

