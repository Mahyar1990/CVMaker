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
                
    }
    
}
