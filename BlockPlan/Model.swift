//
//  Model.swift
//  BlockPlan
//
//  Created by alumno on 20/03/24.
//

import Foundation
import SwiftUI

struct Place {
    var id: UUID = UUID()
    var name: String
    var category: PlaceCategory
}

enum PlaceCategory {
    case personalLife
    case workLife
}

struct CustomSquare: Identifiable {
    var id = UUID()
    var name: String
}
