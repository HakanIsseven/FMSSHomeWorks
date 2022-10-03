//
//  PostListTableViewCell.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 24.09.2022.
//

import UIKit

class PostListTableViewCell: UITableViewCell {

    
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private(set) weak var PostTitleLabel: UILabel!
    
    
    @IBOutlet private(set)  weak var PostDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.backgroundColor = .lightGray.withAlphaComponent(0.4)
        containerView.layer.cornerRadius = 8
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
