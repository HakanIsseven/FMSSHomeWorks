//
//  ToDoDetailsViewController.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 24.09.2022.
//

import UIKit
import CoreData

class ToDoDetailsViewController: UIViewController {

    @IBOutlet weak var detailsTaskTitle: UILabel!
    
    @IBOutlet weak var detailsTaskDescription: UILabel!
    
    var globalData: TodoUserInfoEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let title = globalData?.title {
            detailsTaskTitle.text = title
            
        }
        
        if let descriptions = globalData?.descriptions {
            detailsTaskDescription.text = descriptions
        }
        
    }
    
        
    
    
    @IBAction func taskCompletedTapped(_ sender: Any) {
        
        if let status = globalData?.checkbox {
            if !status {
                print("false")
                globalData?.checkbox = true
            } else {
                
                globalData?.checkbox = false

            }
            
        }
      
        navigationController?.popToRootViewController(animated: true)
    }
    
    }


