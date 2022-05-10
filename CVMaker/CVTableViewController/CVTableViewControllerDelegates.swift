//
//  CVTableViewControllerDelegates.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

// MARK: - TableViewDelegates implementation
extension CVTableViewController {
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            let vc = PersonalInfoViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = WorkSummaryCollectionViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = SkillsCollectionViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = EducationDetailsCollectionViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = ProjectDetailsCollectionViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("")
        }
        
    }
    
}
