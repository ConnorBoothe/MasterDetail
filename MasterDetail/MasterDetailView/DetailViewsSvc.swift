//
//  DetailViewsProtocol.swift
//  MasterDetail
//
//  Created by Connor Boothe on 7/5/23.
//

import Foundation
import SwiftUI

protocol DetailViewsSvc: View {
    associatedtype T: Hashable
    var viewSelection: T { get }
}
