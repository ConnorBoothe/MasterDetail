//
//  MasterRowView.swift
//  MasterDetail
//
//  Created by Connor Boothe on 7/5/23.
//

import SwiftUI

struct MasterRowView<T: Hashable>: View {
    @Binding var selectedView: T
    @Binding var columnVisibility: NavigationSplitViewVisibility
    let tab: Tab<T>
    let tabFontColor: Color
    let selectedTabFontColor: Color
    let selectedTabBackgroundColor: Color
    
    var body: some View {
        Button(action: {
            withAnimation {
                if UIDevice.isIPad {
                    self.selectedView = tab.viewSelector
                    if !UIDevice.isLandscape {
                        columnVisibility = .detailOnly
                    } else {
                        columnVisibility = .doubleColumn
                    }
                }
            }
        }){
            HStack {
                Image(systemName: tab.icon)
                    .font(.system(size: 25))
                
                Text(tab.name)
                    .font(.system(size: 25))
                   
            }.foregroundColor(selectedView == tab.viewSelector ? selectedTabFontColor : tabFontColor)
            .padding(.vertical, 5).padding(.horizontal, 15)
        }.background(
            ZStack {
                if selectedView == tab.viewSelector {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(selectedTabBackgroundColor)
                }
            }
        ).padding(5)
    }
}
