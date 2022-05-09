//
//  CVItems.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

enum CVItems {
    
    case PersonalInfo
    case WorkSummary
    case Skills
    case EducationDetails
    case ProjectDetails
    
    func getStringValue() -> String {
        switch self {
        case .PersonalInfo:     return Constants.Images.personalInfo
        case .WorkSummary:      return Constants.Images.workSummary
        case .Skills:           return Constants.Images.skills
        case .EducationDetails: return Constants.Images.educationDetails
        case .ProjectDetails:   return Constants.Images.projectDetails
        }
    }
    
    func getImage() -> UIImage {
        switch self {
        case .PersonalInfo:     return UIImage.MyCustomImages.PersonalInfo
        case .WorkSummary:      return UIImage.MyCustomImages.WorkSummary
        case .Skills:           return UIImage.MyCustomImages.Skills
        case .EducationDetails: return UIImage.MyCustomImages.EducationDetails
        case .ProjectDetails:   return UIImage.MyCustomImages.ProjectDetails
        }
    }
    
}
