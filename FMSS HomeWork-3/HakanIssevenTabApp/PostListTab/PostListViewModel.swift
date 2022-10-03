//
//  PostListViewModel.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 24.09.2022.
//

import Foundation

protocol PostListViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [PostCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}


class PostListViewModel {
    
    private let model = PostListModel()
    
    weak var viewDelegate: PostListViewModelViewProtocol?
    
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    

    
}


private extension PostListViewModel  {
    
    @discardableResult
    func makeViewBasedModel(_ posts: [Post])-> [PostCellViewModel] {
        return posts.map {.init(title: $0.title, desc: $0.body)
        }
    }
}


extension PostListViewModel: PostListModelProtocol {
    func didDataFetchProcessFinished(_ isSuccess: Bool) {
        
        if isSuccess {
            
            let posts = model.posts
            let cellModels = makeViewBasedModel(posts)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        } else {
            
            viewDelegate?.showEmptyView()
            
        }

        
    }
    
}
