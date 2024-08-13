//
//  SearchViewController.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 27/03/2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var subHeadingLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField! {
        didSet { searchTextField.addDoneToolbar() }
    }
    
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var appendButton: UIButton!
    @IBOutlet weak var ingredientsSectionHeader: UIStackView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchButton: SearchButton!
    
    
    private lazy var repository: RecipesRepositoryInput = {
        let repo = RecipesRepository()
        repo.output = self
        return repo
    }()
    

    lazy var stack = CoreDataStack()
    lazy var managedObject = stack.mainContext
    lazy var coredataManager = RecipesCoredataManager(stack: stack, managedObject: managedObject)
    
    var dataSource: [String] = [] {
        didSet {
            setupIngredientsSection()
        }
    }
    
    var api: RecipleaseApiInput = RecipleaseApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    
    @IBAction func appendButtonPressed(_ sender: Any) {
        guard
            let safeIngredients = searchTextField.text?.replacingOccurrences(of: " ", with: "")
        else {
            dismissKeyboard()
            showAlert(message: S.errorUnknown)
            return
        }
        
        guard !safeIngredients.isEmpty else {
            dismissKeyboard()
            showAlert(message: S.errorEmptyIngredients)
            return
        }
        
        let ingredients = safeIngredients.components(separatedBy: ",")
        
        dataSource.append(contentsOf: ingredients)
        dataSource = dataSource.filterDuplicates()
        dismissKeyboard()
        searchTextField.text = ""
        collectionView.reloadData()
    }
        
    @IBAction func clearButtonPressed(_ sender: Any) {
        dataSource = [ ]
        collectionView.reloadData()
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        searchButton.isLoading = true
        let query = dataSource.joined(separator: "+")
        repository.performSearch(query: query)
    }
}

extension SearchViewController: RecipesRepositoryOutput {
    func didPerformSearch(_ result: Result<RecipeResponse, Error>) {
        switch result {
        case .success(let response):
            didUpdate(state: .success(response))
        case .failure(_):
            didUpdate(state: .error)
        }
    }
    
    func didUpdate(state: SearchViewState) {
        searchButton.isLoading = state.isLoading
        switch state {
        case .success(let response):
            
            guard let coredataRecipes = coredataManager.storedRecipes() else { return }
            
            let recipesBO: [RecipeBO] = response.recipes.map { recipe in
                    let isFavorite = coredataRecipes.contains{ $0.url == recipe.url }
                    return RecipeBO(recipe: recipe, isFavorite: isFavorite)
                }
            
            router?.push(ListModuleFactory.makeModule(model: recipesBO, type: .search))
        case .error:
            showAlert(message: S.errorNetwork)
        default: break
        }
    }
}
