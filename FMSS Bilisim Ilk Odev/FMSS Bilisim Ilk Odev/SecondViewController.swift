//
//  SecondViewController.swift
//  FMSS Bilisim Ilk Odev
//
//  Created by Hakan İşseven on 8.09.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var FavoritePokemonTextField: UITextField!
    
    
    var nameInfo = ""
    var surnameInfo = ""
    var ageInfo = ""
    var FavoritePokemonInfo = ""

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

 
    @IBAction func registerButton(_ sender: Any) {
        
        nameInfo = nameTextField.text!
        surnameInfo = surnameTextField.text!
        ageInfo = ageTextField.text!
        FavoritePokemonInfo = FavoritePokemonTextField.text!
        
        performSegue(withIdentifier: "toFirstViewController", sender: nil)
        
        // I changed to empty user information variables  with the data we received via textfields
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toFirstViewController" {
            let destinationVC = segue.destination as! ViewController
            destinationVC.userAgeInfo = ageInfo
            destinationVC.userNameInfo = nameInfo
            destinationVC.userSurnameInfo = surnameInfo
            destinationVC.userFavoritePokemonInfo = FavoritePokemonInfo
            
            // We use prepare function to reach other viewController variables, and after than that we changed to first viewcontroller variables with real user info.
            
            
        }
        
    }
    
    
    
    
    

}
