//
//  ToDoTabViewController.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 23.09.2022.
//

import UIKit

class ToDoTabViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupTableView()
               
    }
    
    private func setupTableView() {
        TableView.delegate = self
        TableView.dataSource = self
        
    }

    @IBAction func ToDoAddButtonTapped(_ sender: Any) {
     
        let addingVc = self.storyboard?.instantiateViewController(withIdentifier: "ToDoAddingViewController") as! ToDoAddingViewController
        self.present(addingVc, animated: true)
        
    }
    
    
    
    
    
}


extension ToDoTabViewController: UITableViewDelegate  {
    
    
}

extension ToDoTabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()

        return cell

        
    }
    
    
}
