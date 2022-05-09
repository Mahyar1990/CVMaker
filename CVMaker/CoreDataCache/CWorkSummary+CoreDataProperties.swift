//
//  CWorkSummary+CoreDataProperties.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//
//

import Foundation
import CoreData


extension CWorkSummary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CWorkSummary> {
        return NSFetchRequest<CWorkSummary>(entityName: "CWorkSummary")
    }

    @NSManaged public var duration:     String?
    @NSManaged public var descriptions: String?
    @NSManaged public var companyName:  String?

}

extension CWorkSummary : Identifiable {

}
