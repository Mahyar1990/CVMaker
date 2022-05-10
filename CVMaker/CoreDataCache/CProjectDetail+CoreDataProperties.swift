//
//  CProjectDetail+CoreDataProperties.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//
//

import Foundation
import CoreData


extension CProjectDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CProjectDetail> {
        return NSFetchRequest<CProjectDetail>(entityName: "CProjectDetail")
    }

    @NSManaged public var usedTechnologies: String?
    @NSManaged public var teamSize:         String?
    @NSManaged public var role:             String?
    @NSManaged public var projectSummary:   String?
    @NSManaged public var projectName:      String?

}

extension CProjectDetail : Identifiable {

}
