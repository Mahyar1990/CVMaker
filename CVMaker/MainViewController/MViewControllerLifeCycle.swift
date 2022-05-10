//
//  MViewControllerLifeCycle.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

extension MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        setupNavigationBar()
        setupView()
        
        retrieveDataFromCache()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.myBoldSystemFont(ofSize: 16)]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = Constants.Main.appTitle
    }
    
    
    func retrieveDataFromCache() {
        DispatchQueue.global().async {
            Cache.sharedInstance.retrieveAllPersonalInfoEntities { [weak self] (item, data) in
                DispatchQueue.main.async {  [weak self] in
                    if let _ = item {
                        self?.createButton.setTitle(Constants.Main.editCV, for: UIControl.State.normal)
                        self?.downloadPDFButton.isHidden = false
                        self?.downloadPDFButton.isEnabled = true
                    } else {
                        self?.createButton.setTitle(Constants.Main.createCV, for: UIControl.State.normal)
                        self?.downloadPDFButton.isHidden = true
                        self?.downloadPDFButton.isEnabled = false
                    }
                }
            }
        }
    }
    
}
