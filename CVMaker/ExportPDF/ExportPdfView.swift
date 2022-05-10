//
//  ExportPdfView.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/10/22.
//

import UIKit

extension ExportPDF {
    
    func generatePDF() -> Data {
        addDataToPDF()
        let pdfData = pdf.generatePDFdata()
        return pdfData
//        // write to file
//        try? pdfData.writeToFile(path, options: .DataWritingAtomic)
    }
    
    private func addDataToPDF()  {
        pdf.addText("My Resume")
        pdf.addLineSeparator()
        
        pdf.addText(Constants.Main.personalInfo)
        pdf.addImage(userImage ?? UIImage(named: Constants.Images.defaultAvatar)!)
        pdf.addText("\(Constants.PersonalInfo.name) : \(personalInfo.name ?? "")")
        pdf.addText("\(Constants.PersonalInfo.cellPhone) : \(personalInfo.cellPhone ?? "")")
        pdf.addText("\(Constants.PersonalInfo.email) : \(personalInfo.email ?? "")")
        pdf.addText("\(Constants.PersonalInfo.address) : \(personalInfo.address ?? "")")
        pdf.addText("\(Constants.PersonalInfo.experience) : \(personalInfo.experience ?? "")")
        pdf.addText("\(Constants.PersonalInfo.objective) : \(personalInfo.objective ?? "")")
        
        pdf.addLineSeparator()
        
        pdf.addText(Constants.Main.workSummary)
        if let ws = workSummaries {
            for item in ws {
                pdf.addText("\(Constants.WorkSummary.companyName) : \(item.companyName ?? "")")
                pdf.addText("\(Constants.WorkSummary.duration) : \(item.duration ?? "")")
                pdf.addText("\(Constants.WorkSummary.description) : \(item.descriptions ?? "")")
                pdf.addVerticalSpace(10)
            }
        }
        
        pdf.addLineSeparator()
        
        pdf.addText(Constants.Main.projectDetails)
        if let pd = projectDetails {
            for item in pd {
                pdf.addText("\(Constants.ProjectDetail.projectName) : \(item.projectName ?? "")")
                pdf.addText("\(Constants.ProjectDetail.teamSize) : \(item.teamSize ?? "")")
                pdf.addText("\(Constants.ProjectDetail.usedTechnologies) : \(item.usedTechnologies ?? "")")
                pdf.addText("\(Constants.ProjectDetail.role) : \(item.role ?? "")")
                pdf.addText("\(Constants.ProjectDetail.projectSummary) : \(item.projectSummary ?? "")")
                pdf.addVerticalSpace(10)
            }
        }
        
        pdf.addLineSeparator()
        
        pdf.addText(Constants.Main.educationDetails)
        if let ed = educationDetails {
            for item in ed {
                pdf.addText("\(Constants.EducationDetail.className) : \(item.clasName ?? "")")
                pdf.addText("\(Constants.EducationDetail.passingYear) : \(item.passingYear ?? "")")
                pdf.addText("\(Constants.EducationDetail.percentage) : \(item.percentage ?? "")")
                pdf.addVerticalSpace(10)
            }
        }
        
        pdf.addLineSeparator()
        
        pdf.addText(Constants.Main.educationDetails)
        if let sk = skills {
            for item in sk {
                pdf.addText("\(item.writeSkill ?? "")")
            }
        }
        
        pdf.addLineSeparator()
    }
    
}
