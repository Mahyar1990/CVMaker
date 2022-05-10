//
//  MViewControllerViewMethods.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import Foundation

extension MainViewController {
    
    @objc func createButtonDidSelected() {
        let vc = CVTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func editButtonDidSelected() {
        
    }
    
}
