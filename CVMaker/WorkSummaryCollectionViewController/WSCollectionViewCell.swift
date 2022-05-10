//
//  WSCollectionViewCell.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

class WorkSummaryCollectionViewCell: BaseCollectionViewCell {
    
    let companyNameLabel = UILabel()
    let companyNameTextField = TextField()
    
    let durationLabel = UILabel()
    let durationTextField = TextField()
    
    let descriptionLabel = UILabel()
    let descriptionTextView = UITextView()
    
    let removeButton = UIButton()
    
    var workSummaryCellViewModel: WorkSummaryCellViewModel! {
        didSet {
            
            if let name = workSummaryCellViewModel.companyName {
                companyNameTextField.text = name
            } else {
                companyNameTextField.text = ""
            }
            if let duration = workSummaryCellViewModel.duration {
                durationTextField.text =  duration
            } else {
                durationTextField.text =  ""
            }
            if let description = workSummaryCellViewModel.description {
                descriptionTextView.text = description
            } else {
                descriptionTextView.text = ""
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
        companyNameLabel.setupMyCustomStyle(textColor: .gray, fontSize: 14, adjustFontSize: true)
        durationLabel.setupMyCustomStyle(textColor: .gray, fontSize: 14, adjustFontSize: true)
        descriptionLabel.setupMyCustomStyle(textColor: .gray, fontSize: 14, adjustFontSize: true)
        
        companyNameLabel.text   = Constants.WorkSummary.companyName
        durationLabel.text      = Constants.WorkSummary.duration
        descriptionLabel.text   = Constants.WorkSummary.description
        
        setupTextBoxes(withTextField: companyNameTextField, withTextView: nil)
        setupTextBoxes(withTextField: durationTextField, withTextView: nil)
        setupTextBoxes(withTextField: nil, withTextView: descriptionTextView)
        
        removeButton.setupMyCustomStyle(contentMode: nil, fontSize: 14, fontColor: .white)
        let image = UIImage.MyCustomImages.Trash.withRenderingMode(.alwaysTemplate)
        removeButton.setImage(image, for: .normal)
        removeButton.tintColor = .systemRed
        removeButton.layer.cornerRadius = 16
    }
    private func setupTextBoxes(withTextField: TextField?, withTextView: UITextView?) {
        if let tf = withTextField {
            tf.setupMyCustomStyle(textColor: .black, fontSize: 14, adjustFontSize: true)
            tf.layer.borderWidth = 0.5
            tf.layer.cornerRadius = 4
        }
        if let tv = withTextView {
            tv.setupMyCustomStyle(textColor: .black, fontSize: 14, adjustFontSize: true)
            tv.layer.borderWidth = 0.5
            tv.layer.cornerRadius = 4
        }
    }
    
    private func setupViewLayout() {
        self.addSubview(companyNameLabel)
        self.addSubview(companyNameTextField)
        
        self.addSubview(durationLabel)
        self.addSubview(durationTextField)
        
        self.addSubview(descriptionLabel)
        self.addSubview(descriptionTextView)
        
        self.addSubview(removeButton)
        
        companyNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        companyNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        companyNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        companyNameLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        companyNameTextField.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor).isActive = true
        companyNameTextField.leftAnchor.constraint(equalTo: companyNameLabel.leftAnchor).isActive = true
        companyNameTextField.rightAnchor.constraint(equalTo: companyNameLabel.rightAnchor).isActive = true
        companyNameTextField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        durationLabel.topAnchor.constraint(equalTo: companyNameTextField.bottomAnchor, constant: 4).isActive = true
        durationLabel.leftAnchor.constraint(equalTo: companyNameLabel.leftAnchor).isActive = true
        durationLabel.rightAnchor.constraint(equalTo: companyNameLabel.rightAnchor).isActive = true
        durationLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        durationTextField.topAnchor.constraint(equalTo: durationLabel.bottomAnchor).isActive = true
        durationTextField.leftAnchor.constraint(equalTo: companyNameLabel.leftAnchor).isActive = true
        durationTextField.rightAnchor.constraint(equalTo: companyNameLabel.rightAnchor).isActive = true
        durationTextField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: durationTextField.bottomAnchor, constant: 4).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: companyNameLabel.leftAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: companyNameLabel.rightAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: companyNameLabel.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: companyNameLabel.rightAnchor).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        removeButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 24).isActive = true
        removeButton.rightAnchor.constraint(equalTo: companyNameLabel.rightAnchor).isActive = true
        removeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        removeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
}

