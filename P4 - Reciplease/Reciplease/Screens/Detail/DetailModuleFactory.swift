//
//  DetailModuleFactory.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 17/04/2021.
//

import UIKit

class DetailModuleFactory {
    class func makeModule(model: RecipeBO) -> DetailViewController {
        let view = DetailViewController()
        view.model = model
        return view
    }
}
