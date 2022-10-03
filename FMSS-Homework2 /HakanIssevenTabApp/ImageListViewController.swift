//
//  ImageListViewController.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 25.09.2022.
//

import UIKit

class ImageListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

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
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    
}
