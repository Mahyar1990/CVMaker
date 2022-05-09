//
//  CEducationDetail+CoreDataProperties.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//
//

import Foundation
import CoreData


extension CEducationDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CEducationDetail> {
        return NSFetchRequest<CEducationDetail>(entityName: "CEducationDetail")
    }

    @NSManaged public var clasName:     String?
    @NSManaged public var passingYear:  String?
    @NSManaged public var percentage:   String?

}

extension CEducationDetail : Identifiable {

}
