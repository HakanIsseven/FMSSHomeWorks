//
//  ImageListEntity.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 25.09.2022.
//

import Foundation

struct JSONImage: Decodable {
    var albumId: Int
    var id: Int
    var url: String
}

struct ImageCellViewModel {
    
    var url: String?
}
