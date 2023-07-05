//
//  MasterDetailSample1.swift
//  MasterDetail
//
//  Created by Connor Boothe on 7/5/23.
//

import SwiftUI

struct MasterDetailSample: View {
    let tabs: [Tab<Route>] = [
        Tab(name: "Home", icon: "house.fill", viewSelector: .home),
        Tab(name: "Appointments", icon: "clock.fill", viewSelector: .appointments),
        Tab(name: "Inspector", icon: "person.fill", viewSelector: .inspector)
    ]
    @State var selectedView: Route = .home
    
    var body: some View {
        MasterDetailView<DetailViews, PhoneView, Route>(
            tabs: tabs,
            selectedView: $selectedView,
            detailView: DetailViews(viewSelection: $selectedView),
            phoneView: PhoneView(tabs: tabs),
            tabFontColor: Color.black,
            selectedTabFontColor: Color.white,
            selectedTabBackgroundColor: Color.blue
        )
    }
}

//DetailViews
private struct DetailViews: DetailViewsSvc {
    @Binding var viewSelection: Route
    
    var body: some View {
        switch(viewSelection){
        case .home:
            HomeView()
        case .appointments:
            AppointmentsView()
        case .inspector:
            InspectorView()
        }
    }
}

//PhoneView
private struct PhoneView: PhoneViewSvc {
    let tabs: [Tab<Route>]
    var body: some View {
        TabView {
            ForEach(tabs, id: \.self){ tab in
                switch(tab.viewSelector){
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
