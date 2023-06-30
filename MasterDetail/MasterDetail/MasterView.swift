//
//  MasterView.swift
//  MasterDetail
//
//  Created by Connor Boothe on 6/28/23.
//

import SwiftUI

struct MasterView: MasterViewProtocol {
    let tabsModel: TabsModel
    @Binding var selectedRoute: Route
    let onTap: (Route) -> Void
    var body: some View {
        List {
            ForEach(tabsModel.tabs, id: \.self){ tab in
                Button(action: {
                    onTap(tab.route)
                }){
                    HStack {
                        Image(systemName: tab.icon)
                            .font(.system(size: 25))
                            .foregroundColor(selectedRoute == tab.route ? Color.white : Color.black)
                        Text(tab.name)
                            .font(.system(size: 25))
                            .foregroundColor(selectedRoute == tab.route ? Color.white : Color.black)
                    }

                    .padding(5)
                }.background(
                    ZStack {
                        if selectedRoute == tab.route {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.red)
                        }
                    }
                ).padding(5)
            }
        }
    }
}
