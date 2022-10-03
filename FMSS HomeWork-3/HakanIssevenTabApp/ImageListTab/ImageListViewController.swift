//
//  ImageListViewController.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 25.09.2022.
//

import UIKit
import Kingfisher

class ImageListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    private let viewModel = ImageListViewModel()
    private var jsonImages: [ImageCellViewModel] = []
    var tempImages: [ImageCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
        

    }
    
    

}



private extension ImageListViewController {
    
    func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        registerCell()
    }
    func registerCell() {
        collectionView.register(.init(nibName: "ImageListViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageListViewCellIdentifier")
    }
    
}

extension ImageListViewController: UICollectionViewDelegate {
    
}




extension ImageListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return tempImages.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageListViewCellIdentifier", for: indexPath) as! ImageListViewCell
        let url = URL.init(string: tempImages[indexPath.row].url!) //make a url
        cell.imageView.kf.setImage(with: url)
        
        return cell
        
    }
    
    
    
}


extension ImageListViewController: ImageListViewModelViewProtocol {
   
 
    
    func didCellItemFetch(_ jsonImages: [ImageCellViewModel]) {
        self.jsonImages = jsonImages
        var i = 0
        while i < 60 {
            self.tempImages.append(jsonImages[i])
            i = i+1
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
        
        
    }
    
    func showEmptyView() {
        
        // TODO:
        
    }
    
    func hideEmptyView() {
        
        // TODO:
        
    }
    
}

extension ImageListViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        // make the space from edges
    }
    
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: (collectionView.frame.width - 40) / 2, height: 150)
        
        // size arranged for view cells
        
        
    }
    
    
    
}
