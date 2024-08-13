//
//  ListModuleFactory.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 01/05/2021.
//

import Foundation

class ListModuleFactory {
    class func makeModule(model: [RecipeBO], type: ListType) -> ListViewController {
        let view = ListViewController.controllerFromStoryboard(.list)
        view.model = model
        view.type = type
        return view
    }
}
