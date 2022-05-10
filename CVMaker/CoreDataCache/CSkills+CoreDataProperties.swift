//
//  CSkills+CoreDataProperties.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//
//

import Foundation
import CoreData


extension CSkills {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CSkills> {
        return NSFetchRequest<CSkills>(entityName: "CSkills")
    }

    @NSManaged public var writeSkill: String?

}

extension CSkills : Identifiable {

}
