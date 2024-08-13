//
//  ListViewController.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 27/03/2021.
//

import Alamofire
import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emtpyStateView: UIView!
    @IBOutlet weak var emptyStateImage: UIImageView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    var model: [RecipeBO] = [ ]
    var type: ListType = .search
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
       
        setupType()
        setupTableView()
        setupNavigationBar()
        
        emptyLabel.font = .textMedium
        emptyLabel.textColor = .blood
        emtpyStateView.isHidden = true
    }
    
    /// Setups view state.
    /// If model is empty we should give feedback to the user
    private func setupState() {
        if model.isEmpty {
            tableView.isHidden = true
            emtpyStateView.isHidden = false
        } else {
            tableView.isHidden = false
            emtpyStateView.isHidden = true
        }
        
        tableView.reloadData()
    }
    
    private func setupType() {
        if type == .favorite {
            navigationItem.title = S.favorites
            emptyStateImage.image = UIImage(named: "empty-favorites")!
            emptyLabel.text = S.noFavoritesYet + "\n" + S.howToFavorites
        } else {
            navigationItem.title = S.results
            emptyStateImage.image = UIImage(named: "empty-search")!
            emptyLabel.text = S.noResultsFound
        }
    }
    
    private func setupTableView() {
        tableView.backgroundView = nil
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = UIColor.darkPurple
        
        navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.darkPurple,
             NSAttributedString.Key.font: UIFont.textBiggest]
    
        navigationController?.navigationBar.barTintColor = .cream
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

// MARK:- Table View Delegate
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard
            let model = model.getOrNull(at:indexPath.section),
            let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.identifier, for: indexPath) as? RecipeTableViewCell
        else {
            return UITableViewCell()
        }
        
        if
            let cachedData = cacheManager.recipeImages[model.label],
            let image = UIImage(data: cachedData) {
            
            cell.set(image: image)
        } else {
            cell.setImage(with: model.image, and: model.label)
        }
        
        cell.configure(model: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        28
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = DetailModuleFactory.makeModule(model: model[indexPath.section])
        view.delegate = self
        router?.push(view)
    }
}

extension ListViewController: DetailViewControllerDelegate {
    func detailsViewControllerDidDelete(recipe: RecipeBO) {
        model.removeAll { $0.url == recipe.url }
        tableView.reloadData()
    }
}
