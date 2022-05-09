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
        for name in skillItems {
            if name != "" && !name.starts(with: " ") {
                DispatchQueue.global().async {
                    Cache.sharedInstance.updateSkillsEntity(writeSkill: name)
                }
            } else {
                // handle error that 'skill' is required
            }
        }
    }
    
}
