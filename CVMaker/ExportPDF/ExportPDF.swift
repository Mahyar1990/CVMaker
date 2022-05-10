//
//  ExportPDF.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/10/22.
//

import UIKit
import SimplePDF

class ExportPDF {
    
    var personalInfo: CPersonalInfo!
    var userImage: UIImage?
    var workSummaries: [CWorkSummary]?
    var skills: [CSkills]?
    var projectDetails: [CProjectDetail]?
    var educationDetails: [CEducationDetail]?
    
    let A4paperSize = CGSize(width: 595, height: 842)
    var pdf: SimplePDF!
    
    
    init() {
        createPDF()
        fetchDataFromCache()
    }
    
    func createPDF() {
        pdf = SimplePDF(pageSize: A4paperSize, pageMargin: 20.0)
    }
    
}
