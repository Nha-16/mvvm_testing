//
//  ProfileViewModel.swift
//  iOS-mvvm
//
//  Created by BTB_001 on 24/11/21.
//

import Foundation
struct ProfileViewModel {
    static let shared = ProfileViewModel()
    
    func fetch(completion: @escaping ([ArticleModel])->()){
        FeedService.shared.fetchFeed { result in
            
            DispatchQueue.main.async {
                switch result {
                    case .success(let articles):
//                    let articlesModel = articles.compactMap { article in
//                        return ArticleModel(article: article)
//                    }
                    var modelArticles: [ArticleModel] = articles.compactMap(ArticleModel.init)
                    
//                    var modelArticles: [ArticleModel] = []
//
//                    for article in articles {
//
//                        let newArticle = ArticleModel(article: article)
//
//                        modelArticles.append(newArticle)
//
//                    }
                    
                        completion(modelArticles)
                    case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            }
            
           
            
        }
    }
    
}
