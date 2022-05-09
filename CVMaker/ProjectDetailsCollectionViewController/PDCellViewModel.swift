//
//  PDCellViewModel.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import Foundation

struct ProjectDetailCellViewModel {
    
    var projectName:        String?
    var teamSize:           String?
    var projectSummary:     String?
    var usedTechnologies:   String?
    var role:               String?
    
    init(projectName:       String?,
         teamSize:          String?,
         projectSummary:    String?,
         usedTechnologies:  String?,
         role:              String?) {
        
        self.projectName        = projectName
        self.teamSize           = teamSize
        self.projectSummary     = projectSummary
        self.usedTechnologies   = usedTechnologies
        self.role               = role
    }
    
}
