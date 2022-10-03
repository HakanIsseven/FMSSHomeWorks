//
//  CoreDataStack.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 23.09.2022.
//

import Foundation
import CoreData


class CoreDataStak  {
    
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("unsuccessfull container loading...  \(error.localizedDescription)")
            }
       }
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
    
    func saveContext() {
        
        guard managedContext.hasChanges else {
            return
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Error appeared : \(error)")
        }
        
    }
    
    
}
