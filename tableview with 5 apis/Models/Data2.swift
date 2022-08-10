//
//  Data2.swift
//  tableview with 5 apis
//
//  Created by Ayush Sharma on 02/07/22.
//
import Foundation

struct New: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Puma]?
}

struct Puma: Codable {
    let source: Sys?
    let author: String?
    let title: String?
    let article: String?
    let  Description: String?
    let url: String?
    let urlToImage: String?
  //  let publishedAt: Date?
    let content: String?

    
}

struct Sys: Codable {
    let id: String?
    let name: String?
}
