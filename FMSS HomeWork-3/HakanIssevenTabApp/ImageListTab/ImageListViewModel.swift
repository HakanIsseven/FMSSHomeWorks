//
//  ImageListViewModel.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 25.09.2022.
//

import Foundation



protocol ImageListViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [ImageCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}


class ImageListViewModel {
    
    private let model = ImageListModel()
    
    weak var viewDelegate: ImageListViewModelViewProtocol?
    
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    

    
}


private extension ImageListViewModel  {
    
    @discardableResult
    func makeViewBasedModel(_ jsonImages: [JSONImage])-> [ImageCellViewModel] {
        return jsonImages.map {.init(url: $0.url)
        }
    }
}


extension ImageListViewModel: ImageListModelProtocol {
    func didDataFetchProcessFinished(_ isSuccess: Bool) {
        
        if isSuccess {
            
            let jsonImages = model.jsonImages
            let cellModels = makeViewBasedModel(jsonImages)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        } else {
            
            viewDelegate?.showEmptyView()
            
        }

        
    }
    
}
