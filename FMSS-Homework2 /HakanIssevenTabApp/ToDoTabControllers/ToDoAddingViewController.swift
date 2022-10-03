//
//  ToDoAddingViewController.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 24.09.2022.
//

import UIKit

class ToDoAddingViewController: UIViewController {
    
    
    @IBOutlet weak var taskTitleTextField: UITextField!
    
    
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func saveTaskButtonTapped(_ sender: Any) {
            saveDataWithCoreData()
        }
        
        
        private func saveDataWithCoreData() {
            let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let data = TodoUserInfoEntity(context: managedContext)
            if let title = taskTitleTextField.text {
                data.setValue(title, forKey: #keyPath(TodoUserInfoEntity.title)) }
            if let descriptions = taskDescriptionTextField.text {
                data.setValue(descriptions, forKey: #keyPath(TodoUserInfoEntity.descriptions))
                AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        }
        
    }
    

}
