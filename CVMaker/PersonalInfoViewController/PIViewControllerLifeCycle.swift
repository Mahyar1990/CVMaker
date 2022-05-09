//
//  PIViewControllerLifeCycle.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

extension PersonalInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavigationBar()
        setupKeyboardObservers()
        setupObjectsStyles()
        setupView()
        
        retrieveDataFromCache()
    }
    
    func retrieveDataFromCache() {
        DispatchQueue.global().async {
            Cache.sharedInstance.retrieveAllPersonalInfoEntities { [weak self] (item, data) in
                if let object = item {
                    DispatchQueue.main.async { [weak self] in
                        if let name = object.name {
                            self?.nameTextField.text = name
                        }
                        if let address = object.address {
                            self?.residenceAddressTextField2.text = address
                        }
                        if let cellPhone = object.cellPhone {
                            self?.cellPhoneTextField.text = cellPhone
                        }
                        if let email = object.email {
                            self?.emailTextField.text = email
                        }
                        if let experience = object.experience {
                            self?.totalYearsOfExperienceTextField.text = experience
                        }
                        if let objective = object.objective {
                            self?.careerObjectiveTextField.text = objective
                        }
                        if let imageData = data {
                            self?.userImageView.image = UIImage(data: imageData)
                        }
                    }
                }
            }
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.myBoldSystemFont(ofSize: 16)]
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = Constants.Main.personalInfo
        
        createAddBarButton()
    }
    
    private func createAddBarButton() {
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save,
                                             target: self,
                                             action: #selector(saveButtonSelected))
        navigationItem.setRightBarButtonItems([saveButtonItem], animated: true)
    }
    
    @objc func saveButtonSelected() {
        if let name = nameTextField.text {
            if name != "" && !name.starts(with: " ") {
                let address     = residenceAddressTextField2.text
                let cellPhone   = cellPhoneTextField.text
                let email       = emailTextField.text
                let experience  = totalYearsOfExperienceTextField.text
                let objective   = careerObjectiveTextField.text
                var imageData: Data?
                if let image = userImageView.image {
                    imageData = image.jpegData(compressionQuality: 1)
                }
                DispatchQueue.global().async {
                    Cache.sharedInstance.updatePersonalInfoEntity(withName:     name,
                                                                  address:      address,
                                                                  cellPhone:    cellPhone,
                                                                  email:        email,
                                                                  experience:   experience,
                                                                  objective:    objective,
                                                                  pictureData:  imageData)
                }
            } else {
                // handle error that 'Name' is required
                showAlert(alertTitle: Constants.Alert.errorOnSavingData,
                          alertMessage: "The Name textfield should not be empty!",
                          okActionText: Constants.Alert.ok)
            }
        }
    }
    
    private func setupKeyboardObservers() {
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
}
