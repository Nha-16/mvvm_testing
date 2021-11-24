//
//  FeedService.swift
//  iOS-mvvm
//
//  Created by Mavin on 22/11/21.
//

import Foundation

struct FeedService {
    static let shared = FeedService()
    
    let baseUrl = "http://110.74.194.124:3034/api"
    
    func fetchFeed(completion: @escaping (Result<[Article],Error>)->()){
        
        let url = URL(string: "\(baseUrl)/articles")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                return
            }
            do{
                let response = try JSONDecoder().decode(Response.self, from: data)
                
                print(response.message)
                
                completion(.success(response.data))

            }catch let error {
                completion(.failure(error))
            }
            
            
        }.resume()
        
    }
    
}
