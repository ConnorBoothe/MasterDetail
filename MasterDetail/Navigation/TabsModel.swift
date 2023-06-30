//
//  UserViewModel.swift
//  MasterDetail
//
//  Created by Connor Boothe on 6/29/23.
//

import Foundation

class TabsModel {
    @Published var tabs = [
        Tab(name: "Home", icon: "house.fill", route: .home),
        Tab(name: "Appointments", icon: "clock.fill", route: .appointments),
        Tab(name: "Inspector", icon: "person.fill", route: .inspector)
    ]
}

struct Tab: Hashable {
    let name: String
    let icon: String
    let route: Route
    
    init(name: String, icon: String, route: Route) {
        self.name = name
        self.icon = icon
        self.route = route
    }
}
