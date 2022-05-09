//
//  WSCollectionViewController.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

class WorkSummaryCollectionViewController: BaseCollectionViewController {
    
    var objectViewModels = [WorkSummaryCellViewModel]() {
        didSet {
            DispatchQueue.main.async {
                self.myCollectionView.reloadData()
            }
        }
    }
    
}
