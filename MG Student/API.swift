//
//  API.swift
//  MG Student
//
//  Created by Cyberheights Software Technologies Pvt Ltd on 14/12/20.
//

import Foundation
import RSLoadingView



let ipAdrs = "http://120.138.10.249/StudentMobile/"

let notfyApi = "\(ipAdrs)api/MgResult/GetMgResultNoteDetails?htno="

let marksApi = "\(ipAdrs)api/MgResult/GetMgMarksResultDetails?htno={htno}&rollID={rollID}"

let gradeApi = "\(ipAdrs)api/MgResult/GetMgGradeResultDetails?htno="

let noInternalsApi = "\(ipAdrs)api/MgResult/GetMgNoInternalsResultDetails?htno={htno}&rollID={rollID}"

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


