//
//  ViewController.swift
//  FMSS Bilisim Ilk Odev
//
//  Created by Hakan İşseven on 8.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var favoritePokemonLabel: UILabel!
    
    
    var userNameInfo = ""
    var userSurnameInfo = ""
    var userAgeInfo = ""
    var userFavoritePokemonInfo = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Name : \(userNameInfo)"
        surnameLabel.text = "Surname : \(userSurnameInfo)"
        ageLabel.text = "Age : \(userAgeInfo)"
        favoritePokemonLabel.text = "Favorite Pokemon : \(userFavoritePokemonInfo)"
        
        
    }

    
    
    

}

