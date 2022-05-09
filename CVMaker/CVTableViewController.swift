//
//  CVTableViewController.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

class CVTableViewController: UITableViewController {
    
    let items: [CVItems] = [CVItems.PersonalInfo,
                            CVItems.WorkSummary,
                            CVItems.Skills,
                            CVItems.EducationDetails,
                            CVItems.ProjectDetails]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        setupNavigationBar()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.item].getStringValue()
        cell.imageView?.image = items[indexPath.item].getImage()
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.myBoldSystemFont(ofSize: 16)]
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = Constants.Main.editCV
    }
    
}
