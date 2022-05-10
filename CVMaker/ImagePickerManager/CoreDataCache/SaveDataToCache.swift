//
//  SaveDataToCache.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import Foundation
import CoreData


extension Cache {
    
    // MARK: - save/update PersonalInfo
    func updatePersonalInfoEntity(withName:     String,
                                  address:      String?,
                                  cellPhone:    String?,
                                  email:        String?,
                                  experience:   String?,
                                  objective:    String?,
                                  pictureData:  Data?) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CPersonalInfo")
        do {
            if let result = try context.fetch(fetchRequest) as? [CPersonalInfo] {
                // find the object on the cache
                if (result.count > 0) {
                    result.first!.name          = withName
                    result.first!.address       = address
                    result.first!.cellPhone     = cellPhone
                    result.first!.email         = email
                    result.first!.experience    = experience
                    result.first!.objective     = objective
                    
                    // delete the user picture to save newData
                    deleteUserImageFromLocal(imageName: withName)
                    // save new user picture
                    if let data = pictureData {
                        saveUserImageToLocal(withData: data, imageName: withName)
                    }
                    
                    saveContext(subject: "Update CPersonalInfo")
                } else {
                    let theObjectEntity = NSEntityDescription.entity(forEntityName: "CPersonalInfo", in: context)
                    let pi = CPersonalInfo(entity: theObjectEntity!, insertInto: context)
                    pi.name         = withName
                    pi.address      = address
                    pi.cellPhone    = cellPhone
                    pi.email        = email
                    pi.experience   = experience
                    pi.objective    = objective
                    
                    if let data = pictureData {
                        saveUserImageToLocal(withData: data, imageName: withName)
                    }
                    
                    saveContext(subject: "Create CPersonalInfo")
                }
            }
        } catch {
            fatalError("Error on fetching list of CPersonalInfo")
        }
    }
    
    private func deleteUserImageFromLocal(imageName: String) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let myFilePath = path + "/Files/" + "\(imageName)"
        if FileManager.default.fileExists(atPath: myFilePath) {
            do {
                try FileManager.default.removeItem(atPath: myFilePath)
            } catch {
                fatalError("can not delete the image from app bundle!")
            }
        }
    }
    private func saveUserImageToLocal(withData data: Data, imageName: String) {
        // save file on app bundle
        var fileLocalAdress: URL? = nil
        let filesLocalDirectory = getFilesLocalDirectory()
        createDirectory(at: filesLocalDirectory)
        fileLocalAdress = filesLocalDirectory.appendingPathComponent("\(imageName)")
        saveDataToDirectory(data: data, to: fileLocalAdress!)
    }
    
    
    // MARK: - save/update ProjectDetail
//    func updateProjectDetailENtity(projectName:         String,
//                                   teamSize:            String?,
//                                   usedTechnologies:    String?,
//                                   role:                String?,
//                                   summary:             String?) {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CProjectDetail")
//        do {
//            if let result = try context.fetch(fetchRequest) as? [CProjectDetail] {
//                // find the object on the cache
//                if (result.count > 0) {
//                    result.first!.projectName      = projectName
//                    result.first!.projectSummary   = summary
//                    result.first!.role             = role
//                    result.first!.teamSize         = teamSize
//                    result.first!.usedTechnologies = usedTechnologies
//                    saveContext(subject: "Update CProjectDetail")
//                } else {
//                    let theObjectEntity = NSEntityDescription.entity(forEntityName: "CProjectDetail", in: context)
//                    let pi = CProjectDetail(entity: theObjectEntity!, insertInto: context)
//                    pi.projectName      = projectName
//                    pi.projectSummary   = summary
//                    pi.role             = role
//                    pi.teamSize         = teamSize
//                    pi.usedTechnologies = usedTechnologies
//                    saveContext(subject: "Create CProjectDetail")
//                }
//            }
//        } catch {
//            fatalError("Error on fetching list of CProjectDetail")
//        }
//    }
    func updateProjectDetailENtity(objects: [ProjectDetailCellViewModel]) {
        deleteAllProjectDetailEntity()
        saveProjectDetailEntities(withObjects: objects)
    }
    private func saveProjectDetailEntities(withObjects objects: [ProjectDetailCellViewModel]) {
        for item in objects {
            let theObjectEntity = NSEntityDescription.entity(forEntityName: "CProjectDetail", in: context)
            let pi = CProjectDetail(entity: theObjectEntity!, insertInto: context)
            pi.projectName      = item.projectName
            pi.projectSummary   = item.projectSummary
            pi.role             = item.role
            pi.teamSize         = item.teamSize
            pi.usedTechnologies = item.usedTechnologies
            saveContext(subject: "Create CProjectDetail")
        }
    }
    
    
    // MARK: - save/update EducationDetail
//    func updateEducationDetailEntity(clasName:      String,
//                                     passingYear:   String?,
//                                     percentage:    String?) {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CEducationDetail")
//        do {
//            if let result = try context.fetch(fetchRequest) as? [CEducationDetail] {
//                // find the object on the cache
//                if (result.count > 0) {
//                    result.first!.clasName      = clasName
//                    result.first!.passingYear   = passingYear
//                    result.first!.percentage    = percentage
//                    saveContext(subject: "Update CEducationDetail")
//                } else {
//                    let theObjectEntity = NSEntityDescription.entity(forEntityName: "CEducationDetail", in: context)
//                    let pi = CEducationDetail(entity: theObjectEntity!, insertInto: context)
//                    pi.clasName     = clasName
//                    pi.passingYear  = passingYear
//                    pi.percentage   = percentage
//                    saveContext(subject: "Create CEducationDetail")
//                }
//            }
//        } catch {
//            fatalError("Error on fetching list of CEducationDetail")
//        }
//    }
    func updateEducationDetailEntities(objects: [EducationDetailCellViewModel]) {
        deleteAllEducationDetailEntity()
        saveEducationDetailEntities(withObjects: objects)
    }
    private func saveEducationDetailEntities(withObjects objects: [EducationDetailCellViewModel]) {
        for item in objects {
            let theObjectEntity = NSEntityDescription.entity(forEntityName: "CEducationDetail", in: context)
            let pi = CEducationDetail(entity: theObjectEntity!, insertInto: context)
            pi.clasName     = item.className
            pi.passingYear  = item.passingYear
            pi.percentage   = item.percentage
            saveContext(subject: "Create CEducationDetail")
        }
    }
    
    
    // MARK: - save/update WorkSummary
//    func updateWorkSummaryEntoty(companyName:   String,
//                                 duration:      String?,
//                                 descriptions:  String?) {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CWorkSummary")
//        do {
//            if let result = try context.fetch(fetchRequest) as? [CWorkSummary] {
//                // find the object on the cache
//                if (result.count > 0) {
//                    result.first!.companyName   = companyName
//                    result.first!.duration      = duration
//                    result.first!.descriptions  = descriptions
//                    saveContext(subject: "Update CWorkSummary")
//                } else {
//                    let theObjectEntity = NSEntityDescription.entity(forEntityName: "CWorkSummary", in: context)
//                    let pi = CWorkSummary(entity: theObjectEntity!, insertInto: context)
//                    pi.companyName  = companyName
//                    pi.duration     = duration
//                    pi.descriptions = descriptions
//                    saveContext(subject: "Create CWorkSummary")
//                }
//            }
//        } catch {
//            fatalError("Error on fetching list of CWorkSummary")
//        }
//    }
    func updateWorkSummaryEntities(objects: [WorkSummaryCellViewModel]) {
        deleteAllWorkSummaryEntity()
        saveWorkSummaryEntities(withObjects: objects)
    }
    private func saveWorkSummaryEntities(withObjects objects: [WorkSummaryCellViewModel]) {
        for item in objects {
            let theObjectEntity = NSEntityDescription.entity(forEntityName: "CWorkSummary", in: context)
            let pi = CWorkSummary(entity: theObjectEntity!, insertInto: context)
            pi.companyName  = item.companyName
            pi.duration     = item.duration
            pi.descriptions = item.description
            saveContext(subject: "Create CWorkSummary")
        }
    }
    
    
    // MARK: - save/update Skills
//    func updateSkillsEntity(writeSkill: String) {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CSkills")
//        do {
//            if let result = try context.fetch(fetchRequest) as? [CSkills] {
//                // find the object on the cache
//                if (result.count > 0) {
//                    result.first!.writeSkill    = writeSkill
//                    saveContext(subject: "Update CSkills")
//                } else {
//                    let theObjectEntity = NSEntityDescription.entity(forEntityName: "CSkills", in: context)
//                    let pi = CSkills(entity: theObjectEntity!, insertInto: context)
//                    pi.writeSkill  = writeSkill
//                    saveContext(subject: "Create CSkills")
//                }
//            }
//        } catch {
//            fatalError("Error on fetching list of CSkills")
//        }
//    }
    func updateSkillsEntities(objects: [String]) {
        deleteAllSkillsEntity()
        saveSkillEntities(withObjects: objects)
    }
    private func saveSkillEntities(withObjects objects : [String]) {
        for item in objects {
            let theObjectEntity = NSEntityDescription.entity(forEntityName: "CSkills", in: context)
            let pi = CSkills(entity: theObjectEntity!, insertInto: context)
            pi.writeSkill = item
            saveContext(subject: "Create CSkills")
        }
    }
    
    
    
    // MARK: - getFilesLocalDirectory
    private func getFilesLocalDirectory() -> URL {
        let directoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let directoryURL = URL(fileURLWithPath: directoryPath)
        let filesLocalDirectory = directoryURL.appendingPathComponent("Files")
        return filesLocalDirectory
    }
    // MARK: - createDirectory
    private func createDirectory(at url: URL) {
        if !(FileManager.default.fileExists(atPath: url.path, isDirectory: nil)) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                print("directory created at:\n \(url)")
            } catch {
                print("error on creating Directory \n\(error.localizedDescription)")
            }
        }
    }
    // MARK: - saveDataToDirectory
    private func saveDataToDirectory(data: Data, to url: URL) {
        do {
            try data.write(to: url)
        } catch {
            print("error when try to write data on documentDirectory \n\(error.localizedDescription)")
        }
    }
    
}
