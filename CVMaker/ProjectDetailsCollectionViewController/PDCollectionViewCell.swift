//
//  PDCollectionViewCell.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

class ProjectDetailCollectionViewCell: BaseCollectionViewCell {
    
    let projectNameLabel = UILabel()
    let projectNameTextField = TextField()
    
    let teamSizeLabel = UILabel()
    let teamSizeTextField = TextField()
    
    let projectSummaryLabel = UILabel()
    let projectSummaryTextView = UITextView()
    
    let usedTechnologiesLabel = UILabel()
    let usedTechnologiesTextField = TextField()
    
    let roleLabel = UILabel()
    let roleTextField = TextField()
    
    let removeButton = UIButton()
    
    var projectDetailsCellViewModel: ProjectDetailCellViewModel! {
        didSet {
            if let projectName = projectDetailsCellViewModel.projectName {
                projectNameTextField.text = projectName
            } else {
                projectNameTextField.text = ""
            }
            if let teamSize = projectDetailsCellViewModel.teamSize {
                teamSizeTextField.text =  teamSize
            } else {
                teamSizeTextField.text =  ""
            }
            if let projectSummary = projectDetailsCellViewModel.projectSummary {
                projectSummaryTextView.text = projectSummary
            } else {
                projectSummaryTextView.text = ""
            }
            if let usedTechnologies = projectDetailsCellViewModel.usedTechnologies {
                usedTechnologiesTextField.text = usedTechnologies
            } else {
                usedTechnologiesTextField.text = ""
            }
            if let role = projectDetailsCellViewModel.role {
                usedTechnologiesTextField.text = role
            } else {
                usedTechnologiesTextField.text = ""
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
        projectNameLabel.setupMyCustomStyle(textColor: .gray, fontSize: 14, adjustFontSize: true)
        teamSizeLabel.setupMyCustomStyle(textColor: .gray, fontSize: 14, adjustFontSize: true)
        projectSummaryLabel.setupMyCustomStyle(textColor: .gray, fontSize: 14, adjustFontSize: true)
        usedTechnologiesLabel.setupMyCustomStyle(textColor: .gray, fontSize: 14, adjustFontSize: true)
        roleLabel.setupMyCustomStyle(textColor: .gray, fontSize: 14, adjustFontSize: true)
        
        projectNameLabel.text       = Constants.ProjectDetail.projectName
        teamSizeLabel.text          = Constants.ProjectDetail.teamSize
        projectSummaryLabel.text    = Constants.ProjectDetail.projectSummary
        usedTechnologiesLabel.text  = Constants.ProjectDetail.usedTechnologies
        roleLabel.text              = Constants.ProjectDetail.role
        
        setupTextBoxes(withTextField: projectNameTextField)
        setupTextBoxes(withTextField: teamSizeTextField)
        setupTextBoxes(withTextView: projectSummaryTextView)
        setupTextBoxes(withTextField: usedTechnologiesTextField)
        setupTextBoxes(withTextField: roleTextField)
        
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
    private func setupTextBoxes(withTextView tv: UITextView) {
        tv.setupMyCustomStyle(textColor: .black, fontSize: 14, adjustFontSize: true)
        tv.layer.borderWidth = 0.5
        tv.layer.cornerRadius = 4
    }
    
    private func setupViewLayout() {
        self.addSubview(projectNameLabel)
        self.addSubview(projectNameTextField)
        
        self.addSubview(teamSizeLabel)
        self.addSubview(teamSizeTextField)
        
        self.addSubview(projectSummaryLabel)
        self.addSubview(projectSummaryTextView)
        
        self.addSubview(usedTechnologiesLabel)
        self.addSubview(usedTechnologiesTextField)
        
        self.addSubview(roleLabel)
        self.addSubview(roleTextField)
        
        self.addSubview(removeButton)
        
        projectNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        projectNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        projectNameLabel.rightAnchor.constraint(equalTo: self.centerXAnchor, constant: -24).isActive = true
        projectNameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        projectNameTextField.topAnchor.constraint(equalTo: projectNameLabel.topAnchor).isActive = true
        projectNameTextField.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: -24).isActive = true
        projectNameTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        projectNameTextField.bottomAnchor.constraint(equalTo: projectNameLabel.bottomAnchor).isActive = true
        
        teamSizeLabel.topAnchor.constraint(equalTo: projectNameLabel.bottomAnchor, constant: 8).isActive = true
        teamSizeLabel.leftAnchor.constraint(equalTo: projectNameLabel.leftAnchor).isActive = true
        teamSizeLabel.rightAnchor.constraint(equalTo: projectNameLabel.rightAnchor).isActive = true
        teamSizeLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        teamSizeTextField.topAnchor.constraint(equalTo: teamSizeLabel.topAnchor).isActive = true
        teamSizeTextField.leftAnchor.constraint(equalTo: projectNameTextField.leftAnchor).isActive = true
        teamSizeTextField.rightAnchor.constraint(equalTo: projectNameTextField.rightAnchor).isActive = true
        teamSizeTextField.bottomAnchor.constraint(equalTo: teamSizeLabel.bottomAnchor).isActive = true
        
        usedTechnologiesLabel.topAnchor.constraint(equalTo: teamSizeTextField.bottomAnchor, constant: 8).isActive = true
        usedTechnologiesLabel.leftAnchor.constraint(equalTo: projectNameLabel.leftAnchor).isActive = true
        usedTechnologiesLabel.rightAnchor.constraint(equalTo: projectNameLabel.rightAnchor).isActive = true
        usedTechnologiesLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        usedTechnologiesTextField.topAnchor.constraint(equalTo: usedTechnologiesLabel.topAnchor).isActive = true
        usedTechnologiesTextField.leftAnchor.constraint(equalTo: projectNameTextField.leftAnchor).isActive = true
        usedTechnologiesTextField.rightAnchor.constraint(equalTo: projectNameTextField.rightAnchor).isActive = true
        usedTechnologiesTextField.bottomAnchor.constraint(equalTo: usedTechnologiesLabel.bottomAnchor).isActive = true
        
        roleLabel.topAnchor.constraint(equalTo: usedTechnologiesTextField.bottomAnchor, constant: 8).isActive = true
        roleLabel.leftAnchor.constraint(equalTo: projectNameLabel.leftAnchor).isActive = true
        roleLabel.rightAnchor.constraint(equalTo: projectNameLabel.rightAnchor).isActive = true
        roleLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        roleTextField.topAnchor.constraint(equalTo: roleLabel.topAnchor).isActive = true
        roleTextField.leftAnchor.constraint(equalTo: projectNameTextField.leftAnchor).isActive = true
        roleTextField.rightAnchor.constraint(equalTo: projectNameTextField.rightAnchor).isActive = true
        roleTextField.bottomAnchor.constraint(equalTo: roleLabel.bottomAnchor).isActive = true
        
        projectSummaryLabel.topAnchor.constraint(equalTo: roleTextField.bottomAnchor, constant: 8).isActive = true
        projectSummaryLabel.leftAnchor.constraint(equalTo: projectNameLabel.leftAnchor).isActive = true
        projectSummaryLabel.rightAnchor.constraint(equalTo: projectNameLabel.rightAnchor).isActive = true
        projectSummaryLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        projectSummaryTextView.topAnchor.constraint(equalTo: projectSummaryLabel.bottomAnchor).isActive = true
        projectSummaryTextView.leftAnchor.constraint(equalTo: projectSummaryLabel.leftAnchor).isActive = true
        projectSummaryTextView.rightAnchor.constraint(equalTo: projectNameTextField.rightAnchor).isActive = true
        projectSummaryTextView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        removeButton.topAnchor.constraint(equalTo: projectSummaryTextView.bottomAnchor, constant: 16).isActive = true
        removeButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        removeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        removeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
}

