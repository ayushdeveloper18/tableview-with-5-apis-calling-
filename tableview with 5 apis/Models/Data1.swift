//
//  Data1.swift
//  tableview with 5 apis
//
//  Created by Ayush Sharma on 04/07/22.
//

import Foundation

struct Data1: Codable {
    
    let login:String?
    let id: Int?
    let node_id : String?
    let url: String?
    let repos_url: String?
    let events_url: String?
    let hooks_url: String?
    let issues_url: String?
    let members_url: String?
    let public_members_url:String?
    let avatar_url: String?
    let description: String?
    
    enum codingkeys: String, CodingKey {
        case nodeid = "node_id"
        case reposurl = "repos_url"
        case eventsurl = "events_url"
        case hooksurl =  "hooks_url"
        case  issuesurl = "issues_url"
        case membersurl = "members_url"
        case public_membersurl = "public_members_url"
        case avatarurl = " avatar_url"
    }
    
}
