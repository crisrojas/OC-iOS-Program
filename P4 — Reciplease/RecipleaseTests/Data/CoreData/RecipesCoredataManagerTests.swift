//
//  RecipleaseCoredataManagerTests.swift
//  RecipleaseTests
//
//  Created by Cristian Felipe Patiño Rojas on 17/05/2021.
//

import CoreData
import XCTest
@testable import Reciplease

class RecipesCoredataManagerTests: XCTestCase {
    
    var coreDataStack: CoreDataStack!
    var manager: RecipesCoredataManager!
    
    override func setUp() {
        super.setUp()
        coreDataStack = TestCoreDataStack()
        manager = RecipesCoredataManager(
            stack: coreDataStack,
            managedObject: coreDataStack.mainContext
        )
    }
    
    override func tearDown() {
        coreDataStack = nil
        manager = nil
    }
    
    func testAddRecipe() {
        
        let newRecipe = RecipeBO(
            recipe: Recipe(
                uri: "",
                label: "",
                image : "",
                source: "",
                url: "",
                shareAs: "",
                yield: 10,
                ingredients: [],
                totalTime: 0),
            isFavorite: false)
        
        manager.add(recipe: newRecipe)
    }
    
    func testRootContextIsSavedAfterAddingReport() {
        
        let derivedContext = coreDataStack.newDerivedContext()
        
        manager = RecipesCoredataManager(
            stack: coreDataStack,
            managedObject: derivedContext
        )
        
        expectation(
            forNotification: .NSManagedObjectContextDidSave,
            object: coreDataStack.mainContext
        ) { _ in
            return true
        }
        
        derivedContext.perform {
            self.manager.add(recipe:
                                RecipeBO(
                                    recipe: Recipe(
                                        uri: "",
                                        label: "",
                                        image : "",
                                        source: "",
                                        url: "",
                                        shareAs: "",
                                        yield: 10,
                                        ingredients: [],
                                        totalTime: 0),
                                    isFavorite: false))
        }
        
        waitForExpectations(timeout: 2.0) { error in
            XCTAssertNil(error, "Save did not occur")
        }
    }
    
    func testFetchRecipes() {
        
        let recipe = Recipe(
            uri: "\(UUID())",
            label: "Paella",
            image : "",
            source: "",
            url: "",
            shareAs: "",
            yield: 0,
            ingredients: [],
            totalTime: 0
        )
        
        let newRecipe = RecipeBO(recipe: recipe, isFavorite: false)
        self.manager.add(recipe: newRecipe)
        
        let fetchedRecipes = manager.storedRecipes()
        
        XCTAssertNotNil(fetchedRecipes)
        XCTAssertTrue(fetchedRecipes?.count == 1)
        XCTAssertTrue(recipe.uri == fetchedRecipes?.first?.uri)
        XCTAssertTrue(recipe.label == fetchedRecipes?.first?.label)
    }
    
    func testDeleteRecipe() {
     
        let recipe = Recipe(
            uri: "\(UUID())",
            label: "",
            image : "",
            source: "",
            url: "",
            shareAs: "",
            yield: 0,
            ingredients: [],
            totalTime: 0
        )
        
        let newRecipe = RecipeBO(recipe: recipe, isFavorite: false)
        self.manager.add(recipe: newRecipe)
        
        var fetchedRecipes = manager.storedRecipes()
        XCTAssertTrue(fetchedRecipes?.count == 1)
        XCTAssertTrue(recipe.uri == fetchedRecipes?.first?.uri)
        
        manager.delete(recipe: fetchedRecipes!.first!)
        
        fetchedRecipes = manager.storedRecipes()
        
        XCTAssertTrue(fetchedRecipes?.isEmpty ?? false)
    }
}
