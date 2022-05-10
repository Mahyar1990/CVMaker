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
        pdf.addLineSpace(10)
        pdf.addLineSeparator()
        pdf.addLineSpace(10)
        
        pdf.addText(Constants.Main.personalInfo)
        pdf.addLineSpace(10)
        let image = resizeImage(image: userImage ?? UIImage(named: Constants.Images.defaultAvatar)!)
        pdf.addImage(image)
        pdf.addLineSpace(10)
        pdf.addText("\(Constants.PersonalInfo.name) : \(personalInfo.name ?? "")")
        pdf.addText("\(Constants.PersonalInfo.cellPhone) : \(personalInfo.cellPhone ?? "")")
        pdf.addText("\(Constants.PersonalInfo.email) : \(personalInfo.email ?? "")")
        pdf.addText("\(Constants.PersonalInfo.address) : \(personalInfo.address ?? "")")
        pdf.addText("\(Constants.PersonalInfo.experience) : \(personalInfo.experience ?? "")")
        pdf.addText("\(Constants.PersonalInfo.objective) : \(personalInfo.objective ?? "")")
        
        pdf.addLineSpace(20)
        pdf.addLineSeparator()
        pdf.addLineSpace(20)
        
        pdf.addText(Constants.Main.workSummary)
        if let ws = workSummaries {
            for item in ws {
                pdf.addText("\(Constants.WorkSummary.companyName) : \(item.companyName ?? "")")
                pdf.addText("\(Constants.WorkSummary.duration) : \(item.duration ?? "")")
                pdf.addText("\(Constants.WorkSummary.description) : \(item.descriptions ?? "")")
                pdf.addVerticalSpace(10)
            }
        }
        
        pdf.addLineSpace(20)
        pdf.addLineSeparator()
        pdf.addLineSpace(20)
        
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
        
        pdf.addLineSpace(20)
        pdf.addLineSeparator()
        pdf.addLineSpace(20)
        
        pdf.addText(Constants.Main.educationDetails)
        if let ed = educationDetails {
            for item in ed {
                pdf.addText("\(Constants.EducationDetail.className) : \(item.clasName ?? "")")
                pdf.addText("\(Constants.EducationDetail.passingYear) : \(item.passingYear ?? "")")
                pdf.addText("\(Constants.EducationDetail.percentage) : \(item.percentage ?? "")")
                pdf.addVerticalSpace(10)
            }
        }
        
        pdf.addLineSpace(20)
        pdf.addLineSeparator()
        pdf.addLineSpace(20)
        
        pdf.addText(Constants.Main.educationDetails)
        if let sk = skills {
            for item in sk {
                pdf.addText("\(item.writeSkill ?? "")")
            }
        }
        
    }
    
    
    
    private func resizeImage(image: UIImage) -> UIImage {
        let maxSize = CGFloat(88)
        
        if image.size.height >= maxSize && image.size.width >= maxSize {
            UIGraphicsBeginImageContext(CGSize(width: maxSize, height: maxSize))
            image.draw(in: CGRect(x: 0, y: 0, width: maxSize, height: maxSize))
            
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return newImage!
        }
        else if image.size.height >= maxSize && image.size.width < maxSize {
            UIGraphicsBeginImageContext(CGSize(width: image.size.width, height: maxSize))
            image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: maxSize))
            
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return newImage!
        }
        else if image.size.width >= maxSize && image.size.height < maxSize {
            UIGraphicsBeginImageContext(CGSize(width: maxSize, height: image.size.height))
            image.draw(in: CGRect(x: 0, y: 0, width: maxSize, height: image.size.height))
            
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return newImage!
        }
        else {
            return image
        }
    }
    
}
