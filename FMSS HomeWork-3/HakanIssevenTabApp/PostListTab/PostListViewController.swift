//
//  PostListViewController.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 21.09.2022.
//

import UIKit

class PostListViewController: UIViewController {
    
    @IBOutlet weak var PostListTableView: UITableView!
    
    private let viewModel = PostListViewModel()
    private var items: [PostCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()

    }

}


    private extension PostListViewController {
        
        func setupUI() {
            PostListTableView.delegate = self
            PostListTableView.dataSource = self
            
            registerCell()
        }
        func registerCell() {
            PostListTableView.register(.init(nibName: "PostListTableViewCell", bundle: nil), forCellReuseIdentifier: "PostListTableViewCell")
        }
        
    }

extension PostListViewController: UITableViewDelegate {
    

}

extension PostListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostListTableView.dequeueReusableCell(withIdentifier: "PostListTableViewCell") as! PostListTableViewCell
        cell.PostTitleLabel.text = items[indexPath.row].title
        cell.PostDescLabel.text = items[indexPath.row].desc
        
        
        return cell
    }
    
    
}

extension PostListViewController: PostListViewModelViewProtocol {
 
    
    
    func didCellItemFetch(_ items: [PostCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.PostListTableView.reloadData()
        }
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
}
