//
//  MasterViewProtocol.swift
//  MasterDetail
//
//  Created by Connor Boothe on 6/29/23.
//

import Foundation
import SwiftUI

protocol MasterViewProtocol: View {
    var onTap: (Route) -> Void { get }
}

protocol DetailsViewsProtocol: View {
    var route: Route { get }
}
