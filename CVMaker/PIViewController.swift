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
    
}
