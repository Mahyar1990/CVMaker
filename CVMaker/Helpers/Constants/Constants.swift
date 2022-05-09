//
//  Constants.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import Foundation

enum Constants {
    
    enum AppFontName {
        static let regular  = "GillSans"
        static let bold     = "GillSans-Bold"
        static let italic   = "GillSans-Italic"
    }
    
    enum Main {
        static let appTitle = "CV Maker"
        static let createCV = "Create CV"
        static let editCV   = "Edit CV"
        
        static let personalInfo     = "Personal Info"
        static let workSummary      = "Work Summary"
        static let skills           = "Skills"
        static let educationDetails = "Education Details"
        static let projectDetails   = "Project Details"
    }
    
    enum Images {
        static let personalInfo     = "PersonalInfo"
        static let careerObjective  = "CareerObjective"
        static let workSummary      = "WorkSummary"
        static let skills           = "Skills"
        static let educationDetails = "EducationDetails"
        static let projectDetails   = "ProjectDetails"
        static let trash            = "Trash"
        static let editImage        = "EditImage"
        
        static let defaultAvatar    = "UserAvatar"
    }
    
    enum WorkSummary {
        static let companyName  = "Company Name"
        static let duration     = "Duration"
        static let description  = "More Detail"
    }
    enum EducationDetail {
        static let className    = "Class"
        static let passingYear  = "Passing Year"
        static let percentage   = "Percentage"
    }
    enum ProjectDetail {
        static let projectName      = "Project Name"
        static let teamSize         = "Team Size"
        static let projectSummary   = "Project Summary"
        static let usedTechnologies = "Technology Used"
        static let role             = "Role"
    }
    enum PersonalInfo {
        static let name         = "Name"
        static let cellPhone    = "cellPhone number"
        static let email        = "Email Address"
        static let address      = "Resisdence Address"
        static let objective    = "Career Objective"
        static let experience   = "Total Years of experience"
    }
    
}
