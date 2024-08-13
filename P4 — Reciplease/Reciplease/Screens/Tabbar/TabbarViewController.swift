//
//  ViewController.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 20/03/2021.
//
import CoreData
import UIKit

class TabbarViewController: UITabBarController {
    
    lazy var stack = CoreDataStack()
    lazy var managedObject = stack.mainContext
    lazy var coredataManager = RecipesCoredataManager(stack: stack, managedObject: managedObject)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

// MARK: - TabbarController Delegate
extension TabbarViewController: UITabBarControllerDelegate {
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
       
        if
            let navigationController = viewController as? UINavigationController,
            let safeFavoritesViewController = navigationController.viewControllers.first as? ListViewController
            {
            injectCoreDataModel(into: safeFavoritesViewController)
        }
    }
    
    /// CoreData dependency injection into the Favorites Screen.
    /// Needed because we're using the same viewController to show search results
    private func injectCoreDataModel(into viewController: ListViewController) {
        
        
        guard let coreDataRecipes = coredataManager.storedRecipes() else { return }
         
        let model: [RecipeBO] = coreDataRecipes.map { RecipeBO(recipe: $0) }
        
        viewController.type = .favorite
        viewController.model = model
        
    }
}
