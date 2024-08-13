//
//  Edamam.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 20/03/2021.
//

import Alamofire

enum Edamam {
    static let baseURL = "https://api.edamam.com/"
    static let apiKey = ""
    static let appId = ""
    
    case getSearch(query: String)
}

extension Edamam: URLRequestConvertible {
    
    var path: String {
        switch self {
        case .getSearch(_):
            return "search"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getSearch(_):
            return .get
        }
    }

    
    var urlComponents: [URLQueryItem] {
        var components = [URLQueryItem]()
        components.append(URLQueryItem(name: "app_id", value: Edamam.appId))
        components.append(URLQueryItem(name: "app_key", value: Edamam.apiKey))
        
        switch self {
        case .getSearch(let query):
            components.append(URLQueryItem(name: "q", value: query))
            
        }
        return components
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest: URLRequest
        
        switch self {
        case .getSearch(_):
            var components = URLComponents(string: Edamam.baseURL+"/"+path)
            
            components?.queryItems = urlComponents
            components?.queryItems = urlComponents
            
            urlRequest = URLRequest(url: (components?.url!)!)
        }
        
        return urlRequest
    }
    
}
