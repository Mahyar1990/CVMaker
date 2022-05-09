//
//  EDCollectionViewController.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

class EducationDetailsCollectionViewController: BaseCollectionViewController {
    
    var objectViewModels = [EducationDetailCellViewModel]() {
        didSet {
            DispatchQueue.main.async {
                self.myCollectionView.reloadData()
            }
        }
    }
    
}
