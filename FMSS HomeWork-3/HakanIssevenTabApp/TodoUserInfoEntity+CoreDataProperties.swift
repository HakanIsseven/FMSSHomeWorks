//
//  TodoUserInfoEntity+CoreDataProperties.swift
//  HakanIssevenTabApp
//
//  Created by Hakan İşseven on 25.09.2022.
//
//

import Foundation
import CoreData


extension TodoUserInfoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoUserInfoEntity> {
        return NSFetchRequest<TodoUserInfoEntity>(entityName: "TodoUserInfoEntity")
    }

    @NSManaged public var checkbox: Bool
    @NSManaged public var date: Date?
    @NSManaged public var descriptions: String?
    @NSManaged public var title: String?

}

extension TodoUserInfoEntity : Identifiable {

}
