//
//  NSObject+NameOfClass.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 17/04/2021.
//

import Foundation


extension NSObject {
    class var nameOfClass: String {
        NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
