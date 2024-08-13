//
//  DetailViewController.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 17/04/2021.
//

import Alamofire
import CoreData
import UIKit
import SafariServices


protocol DetailViewDelegate {
    func didTapFavoriteButton(_ checkModel: RecipeBO)
    func didTapGetDirectionButton()
}

protocol DetailViewControllerDelegate: AnyObject {
    func detailsViewControllerDidDelete(recipe: RecipeBO)
}

class DetailViewController: UIViewController {
    
    private lazy var rootView: DetailView = {
        let view = DetailView()
        view.delegate = self
        return view
    }()
    
    var model: RecipeBO!
    weak var delegate: DetailViewControllerDelegate?
    
    lazy var stack = CoreDataStack()
    lazy var managedObject = stack.mainContext
    lazy var coredataManager = RecipesCoredataManager(stack: stack, managedObject: managedObject)
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.set(model: model)
        rootView.setTableViewController(self)
        setupNavbar()
    }
    
    private func setupNavbar() {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension DetailViewController: DetailViewDelegate {
    
    func didTapFavoriteButton(_ model: RecipeBO) {
        if model.isFavorite {
            
            guard let coredataRecipes = coredataManager.storedRecipes() else { return }
            
            guard let recipe = coredataRecipes
                    .filter({ $0.url == model.url })
                    .first else
            {
                showAlert(message: S.errorAddingToFavoritres)
                return
            }
            coredataManager.delete(recipe: recipe)
            delegate?.detailsViewControllerDidDelete(recipe: model)
        } else {
            coredataManager.add(recipe: model)
        }
        
    
        rootView.favoriteButton.toggle()
    }
    
    func didTapGetDirectionButton() {
        if let safeURL = URL(string: model.shareAs) {
               let config = SFSafariViewController.Configuration()
               config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: safeURL, configuration: config)
               present(vc, animated: true)
           }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellModel = model.ingredients
        cell.textLabel?.text = cellModel[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.font = .textMedium
        cell.textLabel?.textColor = .darkPurple
        cell.selectionStyle = .none
        
        return cell
    }
}
