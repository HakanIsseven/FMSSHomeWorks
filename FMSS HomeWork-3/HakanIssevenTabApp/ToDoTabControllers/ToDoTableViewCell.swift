//
//  ToDoTableViewCell.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 25.09.2022.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var toDoTitleLabel: UILabel!
    
    @IBOutlet weak var toDoDescLabel: UILabel!
    
    @IBOutlet weak var toDoCheckImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
