//
//  ExportPdfGetData.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/10/22.
//

import UIKit

extension ExportPDF {
    
    func fetchDataFromCache() {
        retrievePersonalInfoData()
        retrieveWorkSummaryData()
        retrieveSkillsData()
        retrieveProjectDetailsData()
        retrieveEducationDetailsData()
    }
    private func retrievePersonalInfoData() {
        Cache.sharedInstance.retrieveAllPersonalInfoEntities { [weak self] personalInfoObject, imageData in
            self?.personalInfo = personalInfoObject
            if let data = imageData {
                self?.userImage = UIImage(data: data)
            }
        }
    }
    private func retrieveWorkSummaryData() {
        Cache.sharedInstance.retrieveAllWorkSummary { [weak self] workSummaries in
            self?.workSummaries = workSummaries
        }
    }
    private func retrieveSkillsData() {
        Cache.sharedInstance.retrieveAllSkills { [weak self] skills in
            self?.skills = skills
        }
    }
    private func retrieveProjectDetailsData() {
        Cache.sharedInstance.retrieveAllProjectDetail { [weak self] projectDetails in
            self?.projectDetails = projectDetails
        }
    }
    private func retrieveEducationDetailsData() {
        Cache.sharedInstance.retrieveAllEducationDetail { [weak self] educationDetails in
            self?.educationDetails = educationDetails
        }
    }
    
}
