//
//  RemoveDuplicates.swift
//  tabbedViewSwiftParser
//
//  Created by Jason Shu on 12/30/17.
//  Copyright © 2017 Jason Shu. All rights reserved.
//

import Foundation

extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
}
