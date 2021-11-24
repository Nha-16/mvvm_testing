//
//  Article.swift
//  iOS-mvvm
//
//  Created by Mavin on 22/11/21.
//

import Foundation

struct Response: Codable {
    let data: [Article]
    let message: String
}

struct Article: Codable {
    let id: String
    let title: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, updatedAt
        
    }
    
}
