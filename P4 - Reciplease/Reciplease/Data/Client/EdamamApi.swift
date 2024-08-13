//
//  EdamamApi.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 20/03/2021.
//

import Alamofire

protocol RecipleaseApiInput {
    func getSearch(query: String, completion: @escaping (Result<RecipeResponse, Error>) -> Void)
}

class RecipleaseApi: RecipleaseApiInput {
    func getSearch(query: String, completion: @escaping (Result<RecipeResponse, Error>) -> Void) {
        
        do {
            let request = try Edamam.getSearch(query: query).asURLRequest()
            
            AF.request(request).responseJSON { (response) in
                switch response.result {
                case .failure(_):
                    completion(.failure(Error(type: .networkError)))
                case .success:
                    guard let data = response.data else {
                        completion(.failure(Error(type: .noDataError)))
                        return
                    }
                    
                    do {
                        let recipes = try JSONDecoder().decode(RecipeResponse.self, from: data)
                        completion(.success(recipes))
                        return
                    } catch {
                        completion(.failure(Error(type: .decodingError)))
                    }
                }
            }
        } catch {
            return
        }
    }
}
