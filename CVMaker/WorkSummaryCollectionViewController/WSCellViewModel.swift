//
//  WSCellViewModel.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import Foundation

struct WorkSummaryCellViewModel {
    
    var companyName:    String?
    var duration:       String?
    var description:    String?
    
    init(companyName:   String?,
         duration:      String?,
         description:   String?) {
        
        self.companyName    = companyName
        self.duration       = duration
        self.description    = description
        
    }
    
}
