//
//  MasterDetailView.swift
//  MasterDetail
//
//  Created by Connor Boothe on 6/29/23.
//

import SwiftUI

struct MasterDetailView<DetailView: DetailViewsSvc, PhoneView: PhoneViewSvc, T: Hashable>: View {
    let tabs: [Tab<T>]
    @Binding var selectedView: T
    let detailView: DetailView
    let phoneView: PhoneView
    
    @State private var columnVisibility: NavigationSplitViewVisibility = .doubleColumn
    
    var body: some View {
        VStack {
            if UIDevice.isIPhone {
                phoneView
            } else {
                NavigationSplitView(columnVisibility: $columnVisibility) {
                    MasterView(
                        tabs: tabs,
                        selectedView: $selectedView,
                        columnVisibility: $columnVisibility
                    )
                } detail: {
                    detailView
                }.navigationSplitViewStyle(.balanced)
            }
        }.onRotate { orientation in
            columnVisibility = .doubleColumn
        }
    }
}
