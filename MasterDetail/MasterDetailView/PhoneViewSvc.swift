//
//  PhoneViewSvc.swift
//  MasterDetail
//
//  Created by Connor Boothe on 7/5/23.
//

import Foundation
import SwiftUI

protocol PhoneViewSvc: View {
    associatedtype T: Hashable
    var tabs: [Tab<T>] { get }
}
