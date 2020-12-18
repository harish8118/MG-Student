//
//  API.swift
//  MG Student
//
//  Created by Cyberheights Software Technologies Pvt Ltd on 14/12/20.
//

import Foundation
import RSLoadingView



let ipAdrs = "http://120.138.10.249/mgstudent/"

let notfyApi = "\(ipAdrs)api/MgResult/GetMgResultNoteDetails?htno="

let marksApi = "\(ipAdrs)api/MgResult/GetMgMarksResultDetails?htno="

let gradeApi = "\(ipAdrs)api/MgResult/GetMgGradeResultDetails?htno="

let noInternalsApi = "\(ipAdrs)api/MgResult/GetMgNoInternalsResultDetails?htno="

let loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)

struct Notes: Codable {
    let ROLLID: Int?
    let ROLLNAME: String?
    let FORMATID: Int?
    let FORMATNAME: String?
    let LINK_DESCRIPTION: String?
    
    private enum CodingKeys: String, CodingKey {
        case ROLLID
        case ROLLNAME
        case FORMATID
        case FORMATNAME
        case LINK_DESCRIPTION
    }
}

struct GradeResult: Codable {
    let HTNO: String?
    let SNAME: String?
    let GRADE: String?
    let SUBJECTCODE: String?
    let SUBJECTNAME: String?
    let CREDITPOINT: Int?
    let SGPA: String?
    let STATUSNAME: String?
    let CONS: String?
    
    private enum CodingKeys: String, CodingKey {
        case HTNO
        case SNAME
        case GRADE
        case SUBJECTCODE
        case SUBJECTNAME
        case CREDITPOINT
        case SGPA
        case STATUSNAME
        case CONS
    }
}

struct BtechResult: Codable {
    let HTNO: String?
    let SNAME: String?
    let GRADE: String?
    let SUBJECTCODE: String?
    let SUBJECTNAME: String?
    let CREDITPOINT: Int?
    let SGPA: String?
    let STATUSNAME: String?
    let CONS: String?
    let GRADEPOINT: String?
    
    private enum CodingKeys: String, CodingKey {
        case HTNO
        case SNAME
        case GRADE
        case SUBJECTCODE
        case SUBJECTNAME
        case CREDITPOINT
        case SGPA
        case STATUSNAME
        case CONS
        case GRADEPOINT
    }
}

struct InternalResult: Codable {
    let HTNO: String?
    let SNAME: String?
    let THEORYMARKS: Int?
    let IMARKS: Int?
    let SUBJECTNAME: String?
    let GRANDTOTAL: Int?
    let TOTALMARKS: Int?
    let STATUSNAME: String?
    let CONS: String?
    let SUBJECTTYPE:String?
    
    private enum CodingKeys: String, CodingKey {
        case HTNO
        case SNAME
        case THEORYMARKS
        case IMARKS
        case SUBJECTNAME
        case GRANDTOTAL
        case TOTALMARKS
        case STATUSNAME
        case CONS
        case SUBJECTTYPE
    }
}

struct MarksResult: Codable {
    let HTNO: String?
    let SNAME: String?
    let THEORYMARKS: Int?
    let IMARKS: Int?
    let SUBJECTNAME: String?
    let GRANDTOTAL: Int?
    let TOTALMARKS: Int?
    let STATUSNAME: String?
    let CONS: String?
    let SUBJECTTYPE:String?
    let RESULT:String?
    
    private enum CodingKeys: String, CodingKey {
        case HTNO
        case SNAME
        case THEORYMARKS
        case IMARKS
        case SUBJECTNAME
        case GRANDTOTAL
        case TOTALMARKS
        case STATUSNAME
        case CONS
        case SUBJECTTYPE
        case RESULT
    }
}
