//
//  MasterDetailSample2.swift
//  MasterDetail
//
//  Created by Connor Boothe on 7/5/23.
//

import SwiftUI

struct MasterDetailSample1: View {
    let tabs: [Tab<ViewSelector>] = [
        Tab(name: "Settings", icon: "house.fill", viewSelector: .settings),
        Tab(name: "Chat", icon: "clock.fill", viewSelector: .chat),
        Tab(name: "Profile", icon: "person.fill", viewSelector: .profile)
    ]
    @State var selectedView: ViewSelector = .settings

    var body: some View {
        MasterDetailView<DetailViews1, PhoneView1, ViewSelector>(
            tabs: tabs,
            selectedView: $selectedView,
            detailView: DetailViews1(viewSelection: $selectedView),
            phoneView: PhoneView1(tabs: tabs),
            tabFontColor: Color.black,
            selectedTabFontColor: Color.white,
            selectedTabBackgroundColor: Color.red
        )
    }
}

//DetailViews
private struct DetailViews1: DetailViewsSvc {
    @Binding var viewSelection: ViewSelector
    
    var body: some View {
        switch(viewSelection){
        case .settings:
            SettingsView()
        case .chat:
            ChatView()
        case .profile:
            ProfileView()
        }
    }
}


//PhoneView
private struct PhoneView1: PhoneViewSvc {
    let tabs: [Tab<ViewSelector>]
    var body: some View {
        TabView {
            ForEach(tabs, id: \.self){ tab in
                switch(tab.viewSelector){
                case .settings:
                    SettingsView()
                        .tabItem {
                            Image(systemName: tab.icon)
                            Text(tab.name)
                        }
                case .chat:
                    ChatView()
                        .tabItem {
                            Image(systemName: tab.icon)
                            Text(tab.name)
                        }
                case .profile:
                    ProfileView()
                        .tabItem {
                            Image(systemName: tab.icon)
                            Text(tab.name)
                        }
                }
            }
        }
    }
}
