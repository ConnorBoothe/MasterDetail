//
//  ContentView.swift
//  MasterDetail
//
//  Created by Connor Boothe on 6/28/23.
//

import SwiftUI

struct ContentView: View {
    let tabsModel = TabsModel()
    @State var navPath = NavigationPath()
    @State var route: Route = .home
    @State private var columnVisibility: NavigationSplitViewVisibility = .doubleColumn
    @State private var isLandscape: Bool = false
    private var isIphone : Bool { UIDevice.isIPhone }
    
    var body: some View {
        NavigationStack (path: $navPath) {
            VStack {
                Text("Home View")
                
                Button(action: {
                    navPath.append(Navigation.masterDetail)
                }){
                    Text("Go to master detail")
                }
            }.onAppear {
                self.isLandscape = UIDevice.current.orientation.isLandscape
            }.navigationBarHidden(true)
            .navigationDestination(for: Navigation.self){ nav in
                if nav == .masterDetail {
                    MasterDetailView<MasterView, DetailViews>(
                        masterView: MasterView(tabsModel: tabsModel, selectedRoute: $route){ route in
                            withAnimation {
                                if UIDevice.isIPad {
                                    self.route = route
                                    if !self.isLandscape {
                                        columnVisibility = .detailOnly
                                    } else {
                                        columnVisibility = .doubleColumn
                                    }
                                }
                            }
                        },
                        detailView: DetailViews(route: $route),
                        columnVisibility: $columnVisibility,
                        isLandscape: $isLandscape
                    )
                }
            }
        }
    }
}

enum UIType {
    case iPhone
    case iPadPortrait
    case iPadLandscape
}

enum Navigation {
    case masterDetail
}
