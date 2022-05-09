//
//  RetrieveDataFromCache.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import Foundation
import CoreData


extension Cache {
    
    // MARK: - retrieve PersonalInfo methods
    func retrievePersonalInfoEntity(withName name: String,
                                    completion: @escaping (CPersonalInfo?)->()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CPersonalInfo")
        let hashPredicate = NSPredicate(format: "name == %@", name)
        fetchRequest.predicate = hashPredicate
        do {
            if let result = try context.fetch(fetchRequest) as? [CPersonalInfo] {
                // find the object on the cache
                if (result.count > 0) {
                    completion(result.first!)
                }
            }
        } catch {
            fatalError("Error on fetching list of CPersonalInfo")
        }
    }
    
    func retrieveAllPersonalInfoEntities(completion: @escaping (CPersonalInfo?, Data?)->()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CPersonalInfo")
        do {
            if let result = try context.fetch(fetchRequest) as? [CPersonalInfo] {
                // find the object on the cache
                if (result.count > 0) {
                    if let imageData = retrieveFile(imageName: result.first!.name!) {
                        completion(result.first!, imageData.data)
                    } else {
                        completion(result.first!, nil)
                    }
                }
            }
        } catch {
            fatalError("Error on fetching list of CPersonalInfo")
        }
    }
    
    
    // MARK: - retrieve ProjectDetail methods
    func retrieveProjectDetail(withProjectName projectName: String,
                               completion: @escaping (CProjectDetail?)->()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CProjectDetail")
        let hashPredicate = NSPredicate(format: "projectName == %@", projectName)
        fetchRequest.predicate = hashPredicate
        do {
            if let result = try context.fetch(fetchRequest) as? [CProjectDetail] {
                // find the object on the cache
                if (result.count > 0) {
                    completion(result.first!)
                }
            }
        } catch {
            fatalError("Error on fetching list of CProjectDetail")
        }
    }
    
    func retrieveAllProjectDetail(completion: @escaping ([CProjectDetail])->()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CProjectDetail")
        do {
            if let result = try context.fetch(fetchRequest) as? [CProjectDetail] {
                // find the object on the cache
                var list = [CProjectDetail]()
                if (result.count > 0) {
                    for item in result {
                        list.append(item)
                    }
                }
                completion(list)
            }
        } catch {
            fatalError("Error on fetching list of CProjectDetail")
        }
    }
    
    
    // MARK: - retrieve EducationDetail methods
    func retrieveAllEducationDetail(className: String,
                                    completion: @escaping (CEducationDetail?)->()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CEducationDetail")
        let hashPredicate = NSPredicate(format: "clasName == %@", className)
        fetchRequest.predicate = hashPredicate
        do {
            if let result = try context.fetch(fetchRequest) as? [CEducationDetail] {
                // find the object on the cache
                if (result.count > 0) {
                    completion(result.first!)
                }
            }
        } catch {
            fatalError("Error on fetching list of CEducationDetail")
        }
    }
    
    func retrieveAllEducationDetail(completion: @escaping ([CEducationDetail])->()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CEducationDetail")
        do {
            if let result = try context.fetch(fetchRequest) as? [CEducationDetail] {
                // find the object on the cache
                var list = [CEducationDetail]()
                if (result.count > 0) {
                    for item in result {
                        list.append(item)
                    }
                }
                completion(list)
            }
        } catch {
            fatalError("Error on fetching list of CEducationDetail")
        }
    }
    
    
    // MARK: - retrieve WorkSummary methods
    func retrieveWorkSummary(companyName: String,
                             completion: @escaping (CWorkSummary?)->()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CWorkSummary")
        let hashPredicate = NSPredicate(format: "companyName == %@", companyName)
        fetchRequest.predicate = hashPredicate
        do {
            if let result = try context.fetch(fetchRequest) as? [CWorkSummary] {
                // find the object on the cache
                if (result.count > 0) {
                    completion(result.first!)
                }
            }
        } catch {
            fatalError("Error on fetching list of CWorkSummary")
        }
    }
    
    func retrieveAllWorkSummary(completion: @escaping ([CWorkSummary])->()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CWorkSummary")
        do {
            if let result = try context.fetch(fetchRequest) as? [CWorkSummary] {
                // find the object on the cache
                var list = [CWorkSummary]()
                if (result.count > 0) {
                    for item in result {
                        list.append(item)
                    }
                }
                completion(list)
            }
        } catch {
            fatalError("Error on fetching list of CWorkSummary")
        }
    }
    
    
    // MARK: - retrieve Skills methods
    func retrieveSkills(withSkill skill: String,
                        completion: @escaping (CSkills?)->()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CSkills")
        let hashPredicate = NSPredicate(format: "writeSkill == %@", skill)
        fetchRequest.predicate = hashPredicate
        do {
            if let result = try context.fetch(fetchRequest) as? [CSkills] {
                // find the object on the cache
                if (result.count > 0) {
                    completion(result.first!)
                }
            }
        } catch {
            fatalError("Error on fetching list of CSkills")
        }
    }
    
    func retrieveAllSkills(completion: @escaping ([CSkills])->()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CSkills")
        do {
            if let result = try context.fetch(fetchRequest) as? [CSkills] {
                // find the object on the cache
                var list = [CSkills]()
                if (result.count > 0) {
                    for item in result {
                        list.append(item)
                    }
                }
                completion(list)
            }
        } catch {
            fatalError("Error on fetching list of CSkills")
        }
    }
    
    
    public func retrieveFile(imageName: String) -> (filePath: URL?, data: Data)? {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let myFilePath = path + "/Files/" + "\(imageName)"
        
        if let file = getFileDataFromLocalDirectory(atPath: myFilePath) {
            return (file.path, file.data)
        } else {
            return nil
        }
    }
    private func getFileDataFromLocalDirectory(atPath: String) -> (path: URL, data: Data)? {
        var file: (path: URL, data: Data)? = nil
        if FileManager.default.fileExists(atPath: atPath) {
            let fileURL = URL(fileURLWithPath: atPath)
            do {
                let data = try Data(contentsOf: fileURL)
                file = (fileURL, data)
            } catch {
                fatalError("cannot get the fileData from imagPath")
            }
        }
        return file
    }

    
}

