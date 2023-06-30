//
//  MasterDetailView.swift
//  MasterDetail
//
//  Created by Connor Boothe on 6/29/23.
//

import SwiftUI

struct MasterDetailView<MasterView: MasterViewProtocol, DetailView: View>: View {
    let masterView: MasterView
    let detailView: DetailView
    @Binding var columnVisibility: NavigationSplitViewVisibility
    @Binding var isLandscape: Bool
    
    var body: some View {
        VStack {
            if UIDevice.isIPhone {
               IphoneTabView()
            } else {
                NavigationSplitView(columnVisibility: $columnVisibility) {
                    masterView
                } detail: {
                    detailView
                }.navigationSplitViewStyle(.balanced)
            }
        }
        .onRotate { orientatation in
            isLandscape = UIDevice.current.orientation.isLandscape
            columnVisibility = .automatic
        }
    }
}
