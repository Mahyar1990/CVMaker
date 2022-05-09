//
//  Cache.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import Foundation
import CoreData


public class Cache {
    
    static let sharedInstance = Cache()
    
    var coreDataStack: CoreDataStack = CoreDataStack()
    public let context: NSManagedObjectContext
    
    public init() {
        context = coreDataStack.persistentContainer.viewContext
    }
    
    func saveContext(subject: String) {
        do {
            try context.save()
            print("\(subject), has Saved Successfully on CoreData Cache")
        } catch {
            fatalError("\(subject), Error to save data on CoreData Cache")
        }
    }
    
    
    func deleteAndSave(object: NSManagedObject, withMessage message: String) {
        context.delete(object)
        saveContext(subject: message)
    }
       
}
