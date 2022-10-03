//
//  PostListModel.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 24.09.2022.
//

import Foundation


protocol PostListModelProtocol: AnyObject {
    
    func didDataFetchProcessFinished(_ isSuccess: Bool)
    
}

class PostListModel {

    weak var delegate: PostListModelProtocol?
    
    var posts: [Post] = []
    
    func fetchData() {
       
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts") else {
            delegate?.didDataFetchProcessFinished(false)
            return
        }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else {return}
            
            guard
                error == nil
            else {
                self.delegate?.didDataFetchProcessFinished(false)
                return
            }
            
            guard let data = data else {
                self.delegate?.didDataFetchProcessFinished(false)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                self.posts = try  jsonDecoder.decode([Post].self, from: data)
                self.delegate?.didDataFetchProcessFinished(true)
            }catch {
                print("JSON serialization Error")
                self.delegate?.didDataFetchProcessFinished(false)
                
                
            }
            
        }
        
   
        
        task.resume()
        
        
    }
    
}

