//
//  Data+decode.swift
//  Baluchon
//
//  Created by cris on 17/12/2020.
//

import Foundation

extension Data {
    
    static let JSONdecoder = JSONDecoder()
    func mapResponse<T: Decodable>(into type: T.Type) -> T? {
        do {
            let data = try Data.JSONdecoder.decode(type, from: self)
            return data
        } catch {
            return nil
        }
    }
}
