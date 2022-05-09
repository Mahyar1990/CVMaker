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
