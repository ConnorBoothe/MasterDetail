//
//  UserViewModel.swift
//  MasterDetail
//
//  Created by Connor Boothe on 6/29/23.
//

import Foundation

struct Tab<T: Hashable>: Hashable {
    let name: String
    let icon: String
    let viewSelector: T
    
    init(name: String, icon: String, viewSelector: T) {
        self.name = name
        self.icon = icon
        self.viewSelector = viewSelector
    }
}
