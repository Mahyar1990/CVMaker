//
//  EDCellViewModel.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import Foundation

struct EducationDetailCellViewModel {
    
    var className:      String?
    var passingYear:    String?
    var percentage:     String?
    
    init(className:     String?,
         passingYear:   String?,
         percentage:    String?) {
        self.className      = className
        self.passingYear    = passingYear
        self.percentage     = percentage
    }
    
}
