//
//  CoreDataTests.swift
//  RecipleaseTests
//
//  Created by Cristian Felipe Patiño Rojas on 17/05/2021.
//

import CoreData
@testable import Reciplease

class TestCoreDataStack: CoreDataStack {
  override init() {
    super.init()

    
    /// Creates an in-memory persistent store
    let persistentStoreDescription = NSPersistentStoreDescription()
    persistentStoreDescription.type = NSInMemoryStoreType

    
    let container = NSPersistentContainer(
      name: CoreDataStack.modelName,
      managedObjectModel: CoreDataStack.model)

    container.persistentStoreDescriptions = [persistentStoreDescription]

    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
    storeContainer = container
  }
}
