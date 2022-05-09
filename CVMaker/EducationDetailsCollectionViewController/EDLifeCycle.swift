//
//  EDLifeCycle.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit


extension EducationDetailsCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageTitleLabel.text = Constants.Main.educationDetails
        myCollectionView.register(EducationDetailCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        myCollectionView.dataSource = self
    }
    
    @objc override func addButtonSelected() {
        let item = EducationDetailCellViewModel(className: nil, passingYear: nil, percentage: nil)
        objectViewModels.append(item)
        print("item added to objectViewModels")
    }
    
    @objc override func saveButtonSelected() {
    }
    
}