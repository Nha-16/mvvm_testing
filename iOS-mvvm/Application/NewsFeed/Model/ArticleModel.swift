//
//  ArticleModel.swift
//  iOS-mvvm
//
//  Created by Mavin on 22/11/21.
//

import Foundation

struct ArticleModel {
    let id: String
    let title: String
    let date : String
    let byAuthor: String
    
    
    let author:[String] = ["Chinda","Thary","Maya"]
    
    init(article: Article){
        self.id = article.id
        self.title = article.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        let date = dateFormatter.date(from: article.updatedAt)
        
        let readableFormatter = DateFormatter()
        readableFormatter.dateFormat = "EEE. dd MMM yy"
        
        
        self.date = readableFormatter.string(from: date!)
        
        self.byAuthor = author[Int.random(in: 0...2)]
        
        
    }
    
}
