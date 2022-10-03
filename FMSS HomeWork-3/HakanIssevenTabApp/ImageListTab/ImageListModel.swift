//
//  ImageListModel.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 25.09.2022.
//

import Foundation




protocol ImageListModelProtocol: AnyObject {
    
    func didDataFetchProcessFinished(_ isSuccess: Bool)
    
}

class ImageListModel {

    weak var delegate: ImageListModelProtocol?
    
    var jsonImages: [JSONImage] = []
    
    func fetchData() {
       
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/photos") else {
            delegate?.didDataFetchProcessFinished(false)
            return
        }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
        let imageTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
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
                self.jsonImages = try  jsonDecoder.decode([JSONImage].self, from: data)
                self.delegate?.didDataFetchProcessFinished(true)
            }catch {
                print("JSON serialization Error")
                self.delegate?.didDataFetchProcessFinished(false)
                
                
            }
            
        }
        
   
        
        imageTask.resume()
        
      
        
    }
    
}

