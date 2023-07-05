//
//  MasterView.swift
//  MasterDetail
//
//  Created by Connor Boothe on 6/28/23.
//

import SwiftUI

struct MasterView<T: Hashable>: View {
    let tabs: [Tab<T>]
    @Binding var selectedView: T
    @Binding var columnVisibility: NavigationSplitViewVisibility
    let tabFontColor: Color
    let selectedTabFontColor: Color
    let selectedTabBackgroundColor: Color
    
    var body: some View {
        List {
            ForEach(tabs, id: \.self){ tab in
                MasterRowView(
                    selectedView: $selectedView,
                    columnVisibility: $columnVisibility,
                    tab: tab,
                    tabFontColor: tabFontColor,
                    selectedTabFontColor: selectedTabFontColor,
                    selectedTabBackgroundColor: selectedTabBackgroundColor
                )
            }
        }
    }
}
