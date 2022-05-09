//
//  BaseCollectionViewControllerView.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import Foundation

extension BaseCollectionViewController {
    
    func setupView() {
        view.addSubview(pageTitleLabel)
        view.addSubview(myCollectionView)
        
        pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pageTitleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        pageTitleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        pageTitleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        myCollectionView.topAnchor.constraint(equalTo: pageTitleLabel.bottomAnchor).isActive = true
        myCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        myCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}
