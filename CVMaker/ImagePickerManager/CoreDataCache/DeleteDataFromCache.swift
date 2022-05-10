//
//  DeleteDataFromCache.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import Foundation
import CoreData


extension Cache {
    
    // MARK: - PersonalInfo Delete methods
    func deletePersonalInfoEntity(withName name: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CPersonalInfo")
        let hashPredicate = NSPredicate(format: "name == %@", name)
        fetchRequest.predicate = hashPredicate
        
        do {
            if let result = try context.fetch(fetchRequest) as? [CPersonalInfo] {
                // find the object on the cache
                if (result.count > 0) {
                    deleteAndSave(object: result.first!,
                                  withMessage: "CPersonalInfo object deleted from cache")
                    saveContext(subject: "Delete Existing CPersonalInfo")
                }
            }
        } catch {
            fatalError("Error on fetching list of CPersonalInfo")
        }
    }
    
    func deleteAllPersonalInfoEntity() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CPersonalInfo")
        
        do {
            if let result = try context.fetch(fetchRequest) as? [CPersonalInfo] {
                // find the object on the cache
                if (result.count > 0) {
                    for item in result {
                        deleteAndSave(object: item,
                                      withMessage: "CPersonalInfo object deleted from cache")
                    }
                    saveContext(subject: "Delete Existing CPersonalInfo")
                }
            }
        } catch {
            fatalError("Error on fetching list of CPersonalInfo")
        }
    }
    
    
    // MARK: - ProjectDetail Delete methods
    func deleteProjectDetailEntity(withProjectName name: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CProjectDetail")
        let hashPredicate = NSPredicate(format: "projectName == %@", name)
        fetchRequest.predicate = hashPredicate
        
        do {
            if let result = try context.fetch(fetchRequest) as? [CProjectDetail] {
                // find the object on the cache
                if (result.count > 0) {
                    deleteAndSave(object: result.first!,
                                  withMessage: "CProjectDetail object deleted from cache")
                    saveContext(subject: "Delete Existing CProjectDetail")
                }
            }
        } catch {
            fatalError("Error on fetching list of CProjectDetail")
        }
    }
    
    func deleteAllProjectDetailEntity() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CProjectDetail")
        do {
            if let result = try context.fetch(fetchRequest) as? [CProjectDetail] {
                // find the object on the cache
                if (result.count > 0) {
                    for item in result {
                        deleteAndSave(object: item,
                                      withMessage: "CProjectDetail object deleted from cache")
                    }
                    saveContext(subject: "Delete Existing CProjectDetail")
                }
            }
        } catch {
            fatalError("Error on fetching list of CProjectDetail")
        }
    }
    
    
    // MARK: - EducationDetail Delete methods
    func deleteEducationDetailEntity(withProjectName name: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CEducationDetail")
        let hashPredicate = NSPredicate(format: "projectName == %@", name)
        fetchRequest.predicate = hashPredicate
        do {
            if let result = try context.fetch(fetchRequest) as? [CEducationDetail] {
                // find the object on the cache
                if (result.count > 0) {
                    deleteAndSave(object: result.first!,
                                  withMessage: "CEducationDetail object deleted from cache")
                    saveContext(subject: "Delete Existing CEducationDetail")
                }
            }
        } catch {
            fatalError("Error on fetching list of CEducationDetail")
        }
    }
    
    func deleteAllEducationDetailEntity() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CEducationDetail")
        
        do {
            if let result = try context.fetch(fetchRequest) as? [CEducationDetail] {
                // find the object on the cache
                if (result.count > 0) {
                    for item in result {
                        deleteAndSave(object: item,
                                      withMessage: "CEducationDetail object deleted from cache")
                    }
                    saveContext(subject: "Delete Existing CEducationDetail")
                }
            }
        } catch {
            fatalError("Error on fetching list of CEducationDetail")
        }
    }
    
    
    // MARK: - WorkSummary Delete methods
    func deleteWorkSummaryEntity(withCompanyName name: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CWorkSummary")
        let hashPredicate = NSPredicate(format: "companyName == %@", name)
        fetchRequest.predicate = hashPredicate
        do {
            if let result = try context.fetch(fetchRequest) as? [CWorkSummary] {
                // find the object on the cache
                if (result.count > 0) {
                    deleteAndSave(object: result.first!,
                                  withMessage: "CWorkSummary object deleted from cache")
                    saveContext(subject: "Delete Existing CWorkSummary")
                }
            }
        } catch {
            fatalError("Error on fetching list of CWorkSummary")
        }
    }
    
    func deleteAllWorkSummaryEntity() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CWorkSummary")
        do {
            if let result = try context.fetch(fetchRequest) as? [CWorkSummary] {
                // find the object on the cache
                if (result.count > 0) {
                    for item in result {
                        deleteAndSave(object: item,
                                      withMessage: "CWorkSummary object deleted from cache")
                    }
                    saveContext(subject: "Delete Existing CWorkSummary")
                }
            }
        } catch {
            fatalError("Error on fetching list of CWorkSummary")
        }
    }
    
    
    // MARK: - Skills Delete methods
    func deleteSkillsEntity(withCompanyName name: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CSkills")
        let hashPredicate = NSPredicate(format: "companyName == %@", name)
        fetchRequest.predicate = hashPredicate
        do {
            if let result = try context.fetch(fetchRequest) as? [CSkills] {
                // find the object on the cache
                if (result.count > 0) {
                    deleteAndSave(object: result.first!,
                                  withMessage: "CSkills object deleted from cache")
                    saveContext(subject: "Delete Existing CSkills")
                }
            }
        } catch {
            fatalError("Error on fetching list of CSkills")
        }
    }
    
    func deleteAllSkillsEntity() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CSkills")
        do {
            if let result = try context.fetch(fetchRequest) as? [CSkills] {
                // find the object on the cache
                if (result.count > 0) {
                    for item in result {
                        deleteAndSave(object: item,
                                      withMessage: "CSkills object deleted from cache")
                    }
                    saveContext(subject: "Delete Existing CSkills")
                }
            }
        } catch {
            fatalError("Error on fetching list of CSkills")
        }
    }
    
    
}
