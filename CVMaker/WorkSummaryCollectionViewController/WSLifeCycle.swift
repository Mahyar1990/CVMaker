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
    
    override func retrieveDataFromCache() {
        DispatchQueue.global().async {
            Cache.sharedInstance.retrieveAllWorkSummary { [weak self] items in
                for item in items {
                    let viewModel = WorkSummaryCellViewModel(withCacheObject: item)
                    self?.objectViewModels.append(viewModel)
                }
            }
        }
    }
    
    @objc override func addButtonSelected() {
        let item = WorkSummaryCellViewModel(companyName: nil, duration: nil, description: nil)
        objectViewModels.append(item)
        print("item added to objectViewModels")
    }
    
    @objc override func saveButtonSelected() {
        for item in objectViewModels {
            if let name = item.companyName {
                if name != "" && !name.starts(with: " ") {
                    DispatchQueue.global().async {
                        Cache.sharedInstance.updateWorkSummaryEntoty(companyName: name,
                                                                     duration: item.duration,
                                                                     descriptions: item.description)
                    }
                } else {
                    // handle error that 'companyName' is required
                }
            }
        }
    }
    
}
