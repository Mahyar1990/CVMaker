//
//  PIViewControllerView.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

extension PersonalInfoViewController {
    
    // MARK: - setup View Layouts
    func setupView() {
        setupScrollView()
        addUserImageToScrollView()
        addChangeImageButtonToScrollView()
        addLabelAndTextfieldsToScrollView()
    }
    
    private func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    
    private func addUserImageToScrollView() {
        contentView.addSubview(userImageView)
        
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        userImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func addChangeImageButtonToScrollView() {
        contentView.addSubview(changeImageButton)
        
        changeImageButton.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor).isActive = true
        changeImageButton.rightAnchor.constraint(equalTo: userImageView.rightAnchor).isActive = true
        changeImageButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        changeImageButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    private func addLabelAndTextfieldsToScrollView() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameTextField)
        
        contentView.addSubview(cellPhoneLabel)
        contentView.addSubview(cellPhoneTextField)
        
        contentView.addSubview(emailLabel)
        contentView.addSubview(emailTextField)
        
        contentView.addSubview(residenceAddressLabel)
        contentView.addSubview(residenceAddressTextField2)
        
        contentView.addSubview(careerObjectiveLabel)
        contentView.addSubview(careerObjectiveTextField)
        
        contentView.addSubview(totalYearsOfExperienceLabel)
        contentView.addSubview(totalYearsOfExperienceTextField)
        
        nameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 12).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        
        cellPhoneLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8).isActive = true
        cellPhoneLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        cellPhoneLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        cellPhoneLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        cellPhoneTextField.topAnchor.constraint(equalTo: cellPhoneLabel.bottomAnchor).isActive = true
        cellPhoneTextField.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
        cellPhoneTextField.rightAnchor.constraint(equalTo: nameTextField.rightAnchor).isActive = true
        cellPhoneTextField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        
        emailLabel.topAnchor.constraint(equalTo: cellPhoneTextField.bottomAnchor, constant: 8).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        emailLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: nameTextField.rightAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        
        residenceAddressLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8).isActive = true
        residenceAddressLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        residenceAddressLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        residenceAddressLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        residenceAddressTextField2.topAnchor.constraint(equalTo: residenceAddressLabel.bottomAnchor).isActive = true
        residenceAddressTextField2.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
        residenceAddressTextField2.rightAnchor.constraint(equalTo: nameTextField.rightAnchor).isActive = true
        residenceAddressTextField2.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        
        careerObjectiveLabel.topAnchor.constraint(equalTo: residenceAddressTextField2.bottomAnchor, constant: 8).isActive = true
        careerObjectiveLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        careerObjectiveLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        careerObjectiveLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        careerObjectiveTextField.topAnchor.constraint(equalTo: careerObjectiveLabel.bottomAnchor).isActive = true
        careerObjectiveTextField.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
        careerObjectiveTextField.rightAnchor.constraint(equalTo: nameTextField.rightAnchor).isActive = true
        careerObjectiveTextField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        
        totalYearsOfExperienceLabel.topAnchor.constraint(equalTo: careerObjectiveTextField.bottomAnchor, constant: 8).isActive = true
        totalYearsOfExperienceLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        totalYearsOfExperienceLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        totalYearsOfExperienceLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        totalYearsOfExperienceTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24).isActive = true
        totalYearsOfExperienceTextField.topAnchor.constraint(equalTo: totalYearsOfExperienceLabel.bottomAnchor).isActive = true
        totalYearsOfExperienceTextField.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
        totalYearsOfExperienceTextField.rightAnchor.constraint(equalTo: nameTextField.rightAnchor).isActive = true
        totalYearsOfExperienceTextField.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    
}
