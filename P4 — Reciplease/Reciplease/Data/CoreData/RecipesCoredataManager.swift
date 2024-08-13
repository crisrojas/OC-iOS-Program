//
//  RecipeCoredataManager.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 01/05/2021.
//

import CoreData
import Foundation

class RecipesCoredataManager {
    
    let stack: CoreDataStack
    let managedObjectContext: NSManagedObjectContext
    
    
    init(stack: CoreDataStack, managedObject: NSManagedObjectContext) {
        self.stack = stack
        self.managedObjectContext = managedObject
    }
    
    func storedRecipes() -> [RecipeCD]? {
        let reportFetch: NSFetchRequest<RecipeCD> = RecipeCD.fetchRequest()
            do {
              let results = try managedObjectContext.fetch(reportFetch)
              return results
            } catch let error as NSError {
              print("Fetch error: \(error) description: \(error.userInfo)")
            }
            return nil
    }

    func add(recipe: RecipeBO) {
        
        let newRecipe = RecipeCD(context: managedObjectContext)
        
        newRecipe.uri = recipe.uri
        newRecipe.label = recipe.label
        newRecipe.image = recipe.image
        newRecipe.source = recipe.source
        newRecipe.url = recipe.url
        newRecipe.shareAs = recipe.shareAs
        newRecipe.yield = Int16(recipe.yield ?? 0)
        newRecipe.ingredients = recipe.ingredients
        newRecipe.totalTime = Int32(recipe.totalTime)
        
        stack.saveContext(managedObjectContext)
    }
    
    
    func delete(recipe: RecipeCD) {
        managedObjectContext.delete(recipe)
        stack.saveContext(managedObjectContext)
    
    }
}
