//
//  PIViewController.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let userImageView = UIImageView(image: UIImage.MyCustomImages.DefaultAvatar)
    let changeImageButton = UIButton()
    
    let nameLabel = UILabel()
    let cellPhoneLabel = UILabel()
    let emailLabel = UILabel()
    let residenceAddressLabel = UILabel()
    let careerObjectiveLabel = UILabel()
    let totalYearsOfExperienceLabel = UILabel()
    
    let nameTextField = TextField()
    let cellPhoneTextField = TextField()
    let emailTextField = TextField()
    let residenceAddressTextField2 = UITextView()
    let careerObjectiveTextField = TextField()
    let totalYearsOfExperienceTextField = TextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    // MARK: - setup Objects Styles
    func setupObjectsStyles() {
        scrollView.isScrollEnabled = true
        
        userImageView.setupMyCustomStyle()
        userImageView.layer.cornerRadius = 50
        userImageView.layer.borderWidth = 0.5
        userImageView.layer.masksToBounds = true
        
        setupLabel(nameLabel, withName: Constants.PersonalInfo.name)
        setupLabel(cellPhoneLabel, withName: Constants.PersonalInfo.cellPhone)
        setupLabel(emailLabel, withName: Constants.PersonalInfo.email)
        setupLabel(residenceAddressLabel, withName: Constants.PersonalInfo.address)
        setupLabel(careerObjectiveLabel, withName: Constants.PersonalInfo.objective)
        setupLabel(totalYearsOfExperienceLabel, withName: Constants.PersonalInfo.experience)
        
        setupTextField(nameTextField)
        setupTextField(cellPhoneTextField)
        setupTextField(emailTextField)
        setupTextView(residenceAddressTextField2)
        setupTextField(careerObjectiveTextField)
        setupTextField(totalYearsOfExperienceTextField)
        
        cellPhoneTextField.keyboardType = UIKeyboardType.phonePad
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        totalYearsOfExperienceTextField.keyboardType = UIKeyboardType.numbersAndPunctuation
        
        
        changeImageButton.setupMyCustomStyle(contentMode: nil, fontSize: 14, fontColor: .white)
        changeImageButton.backgroundColor = UIColor(white: 0.9, alpha: 0.9)
        changeImageButton.setImage(UIImage.MyCustomImages.EditImage, for: .normal)
        changeImageButton.addTarget(self,
                                    action: #selector(editImageButtonDidSelected),
                                    for:   .touchUpInside)
    }
    
    
    private func setupLabel(_ label: UILabel, withName: String) {
        label.setupMyCustomStyle(textColor:     UIColor.darkGray,
                                 fontSize:      14,
                                 adjustFontSize: true)
        label.text = withName
    }
    
    private func setupTextField(_ textfield: TextField) {
        textfield.setupMyCustomStyle(textColor:     UIColor.black,
                                     fontSize:      12,
                                     adjustFontSize: true)
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.cornerRadius = 4
    }
    
    private func setupTextView(_ textview: UITextView) {
        textview.setupMyCustomStyle(textColor:     UIColor.black,
                                    fontSize:      12,
                                    adjustFontSize: true)
        textview.layer.borderWidth = 1
        textview.layer.borderColor = UIColor.lightGray.cgColor
        textview.layer.cornerRadius = 4
    }
    
    
    @objc func editImageButtonDidSelected() {
        
    }
    
}
