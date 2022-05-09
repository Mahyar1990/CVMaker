//
//  SCollectionViewController.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

class SkillsCollectionViewController: BaseCollectionViewController {
    
    var skillItems = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.myCollectionView.reloadData()
            }
        }
    }
    
}

