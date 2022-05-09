//
//  PDCollectionViewController.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

class ProjectDetailsCollectionViewController: BaseCollectionViewController {
    
    var objectViewModels = [ProjectDetailCellViewModel]() {
        didSet {
            DispatchQueue.main.async {
                self.myCollectionView.reloadData()
            }
        }
    }
    
}
