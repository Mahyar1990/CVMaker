//
//  WSLifeCycle.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit


extension WorkSummaryCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageTitleLabel.text = Constants.Main.workSummary
        myCollectionView.register(WorkSummaryCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        myCollectionView.dataSource = self
    }
    
}
