//
//  IphoneTabView.swift
//  MasterDetail
//
//  Created by Connor Boothe on 6/30/23.
//

import SwiftUI

struct IphoneTabView: View {
    let tabsModel = TabsModel()
    var body: some View {
        TabView {
            ForEach(tabsModel.tabs, id: \.self){ tab in
                switch(tab.route){
                case .home:
                    HomeView()
                        .tabItem {
                            Image(systemName: tab.icon)
                            Text(tab.name)
                         }
                case .appointments:
                    AppointmentsView()
                        .tabItem {
                            Image(systemName: tab.icon)
                            Text(tab.name)
                         }
                case .inspector:
                    InspectorView()
                        .tabItem {
                            Image(systemName: tab.icon)
                            Text(tab.name)
                         }
                }
            }
        }
    }
}
