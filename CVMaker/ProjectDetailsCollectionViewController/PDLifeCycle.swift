//
//  PDLifeCycle.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit


extension ProjectDetailsCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageTitleLabel.text = Constants.Main.educationDetails
        myCollectionView.register(ProjectDetailCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        myCollectionView.dataSource = self
    }
    
    @objc override func addButtonSelected() {
        let item = ProjectDetailCellViewModel(projectName: nil, teamSize: nil, projectSummary: nil, usedTechnologies: nil, role: nil)
        objectViewModels.append(item)
        print("item added to objectViewModels")
    }
    
    @objc override func saveButtonSelected() {
        for item in objectViewModels {
            if let name = item.projectName {
                if name != "" && !name.starts(with: " ") {
                    DispatchQueue.global().async {
                        Cache.sharedInstance.updateProjectDetailENtity(projectName:     name,
                                                                       teamSize:        item.teamSize,
                                                                       usedTechnologies: item.usedTechnologies,
                                                                       role:            item.role,
                                                                       summary:         item.projectSummary)
                    }
                } else {
                    // handle error that 'ProjectName' is required
                }
            }
        }
    }
    
}

