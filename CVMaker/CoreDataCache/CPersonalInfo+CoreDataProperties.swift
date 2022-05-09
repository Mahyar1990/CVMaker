//
//  CPersonalInfo+CoreDataProperties.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//
//

import Foundation
import CoreData


extension CPersonalInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CPersonalInfo> {
        return NSFetchRequest<CPersonalInfo>(entityName: "CPersonalInfo")
    }

    @NSManaged public var address:      String?
    @NSManaged public var cellPhone:    String?
    @NSManaged public var email:        String?
    @NSManaged public var experience:   String?
    @NSManaged public var name:         String?
    @NSManaged public var objective:    String?

}

extension CPersonalInfo : Identifiable {

}
