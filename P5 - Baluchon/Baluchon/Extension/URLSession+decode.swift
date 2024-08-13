//
//  URLSession.swift
//  Baluchon
//
//  Created by cris on 18/12/2020.
//

import Foundation

extension URLSession {
    
    static let shared = URLSession(configuration: .default)
    static func decode<T: Decodable>(url: URL?, into type: T.Type, with completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let safeURL = url else {
            completion(.failure(Error(type: .invalidURL)))
            return
        }
        
        #if DEBUG
        print(safeURL)
        #endif
        
        let task = shared.dataTask(with: safeURL) { (data, response, error) in
            
            guard error == nil else {
                completion(.failure(Error(type: .networkError)))
                return
            }
            
            guard let safeData = data else {
                completion(.failure(Error(type: .noDataError)))
                return
            }
            
            guard let decodedData = safeData.mapResponse(into: type) else {
                completion(.failure(Error(type: .decodingError)))
                return
            }
            
            completion(.success(decodedData))
        }
        task.resume()
    }
}
