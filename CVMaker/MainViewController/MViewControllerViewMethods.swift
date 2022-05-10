//
//  MViewControllerViewMethods.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

extension MainViewController {
    
    @objc func createButtonDidSelected() {
        let vc = CVTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func downloadPDFButtonDidSelected() {
        let pdfObject = ExportPDF()
        let pdfData = pdfObject.generatePDF()
        activityController = UIActivityViewController(activityItems: [pdfData], applicationActivities: nil)
        activityController?.completionWithItemsHandler = { (activityType, completed, _, err) in
            if ( (completed) && (activityType == UIActivity.ActivityType.saveToCameraRoll) ) || (activityType == UIActivity.ActivityType.assignToContact) {
                self.activityController?.dismiss(animated: true, completion: nil)
            } else {
                self.activityController?.dismiss(animated: true, completion: nil)
            }
        }
        activityController?.popoverPresentationController?.sourceView = self.view
        self.present(activityController!, animated: true, completion: {
        })
    }
    
}
