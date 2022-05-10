//
//  SCollectionViewLifeCycle.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

extension SkillsCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageTitleLabel.text = Constants.Main.skills
        myCollectionView.register(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        myCollectionView.dataSource = self
    }
    
    override func retrieveDataFromCache() {
        Cache.sharedInstance.retrieveAllSkills { [weak self] items in
            for item in items {
                self?.skillItems.append(item.writeSkill ?? "")
            }
        }
    }
    
    @objc override func addButtonSelected() {
        let item = ""
        skillItems.append(item)
    }
    @objc override func saveButtonSelected() {
        var canSaveData = true
        for item in skillItems {
            if item == "" || item.starts(with: " ") {
                canSaveData = false
            }
        }
        if canSaveData {
            let objects = skillItems
            DispatchQueue.global().async {
                Cache.sharedInstance.updateSkillsEntities(objects: objects)
            }
        } else {
            // handle error that 'skill' is required
            showAlert(alertTitle: Constants.Alert.errorOnSavingData,
                      alertMessage: "The Skill textfield should not be empty!",
                      okActionText: Constants.Alert.ok)
        }
    }
    
}
