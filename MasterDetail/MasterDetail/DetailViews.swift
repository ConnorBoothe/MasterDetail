//
//  DetailViews.swift
//  MasterDetail
//
//  Created by Connor Boothe on 6/30/23.
//

import SwiftUI

struct DetailViews: DetailsViewsProtocol {
    @Binding var route: Route
    var body: some View {
        switch(route){
        case .home:
            HomeView()
        case .appointments:
            AppointmentsView()
        case .inspector:
            InspectorView()
            
        }
    }
}
