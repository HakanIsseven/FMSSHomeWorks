//
//  ToDoTabViewController.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 23.09.2022.
//

import UIKit
import CoreData

class ToDoTabViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    
    var globalData: [TodoUserInfoEntity] = []
    var rowNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupTableView()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
getData()

    }
   

    private func getData() {
        let fetchRequest: NSFetchRequest <TodoUserInfoEntity> = TodoUserInfoEntity.fetchRequest()
        let sortByDate = NSSortDescriptor(key: #keyPath(TodoUserInfoEntity.date), ascending: false)
        fetchRequest.sortDescriptors = [sortByDate]
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try context.fetch(fetchRequest)
            globalData = results
            print(results.map {$0.checkbox})
        } catch  {
            print(error.localizedDescription)
        }
    
        self.TableView.reloadData()
    }
    
    private func setupTableView() {
        TableView.delegate = self
        TableView.dataSource = self
        
    }
    
    private func registerCell() {
        TableView.register(.init(nibName: "ToDoTableViewCell", bundle: nil), forCellReuseIdentifier: "ToDoTableViewCell")
    }

    @IBAction func ToDoAddButtonTapped(_ sender: Any) {
        let addingVc = self.storyboard?.instantiateViewController(withIdentifier: "ToDoAddingViewController") as! ToDoAddingViewController
        navigationController?.pushViewController(addingVc, animated: true)
    }
}

extension ToDoTabViewController: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let detailsVc = self.storyboard?.instantiateViewController(withIdentifier: "ToDoDetailsViewController") as! ToDoDetailsViewController
        
        detailsVc.globalData = self.globalData[indexPath.row]
        navigationController?.pushViewController(detailsVc, animated: true)
        
        }
}

extension ToDoTabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalData.count   }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell") as! ToDoTableViewCell
        cell.toDoTitleLabel.text = (globalData.map {$0.title!})[indexPath.row]
        cell.toDoDescLabel.text = (globalData.map {$0.descriptions!})[indexPath.row]
        
        if globalData[indexPath.row].checkbox == true {
            cell.toDoCheckImage.image = UIImage(systemName: "checkmark.square") } else {
                cell.toDoCheckImage.image = UIImage(systemName: "square")
            }
        return cell

        
    }
}




