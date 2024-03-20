//
//  PlaceViewModel.swift
//  BlockPlan
//
//  Created by alumno on 20/03/24.
//

import Foundation
class PlaceViewModel: ObservableObject {
    @Published var places: [Place] = [
        Place(name: "Vida Personal", category: .personalLife),
        Place(name: "Vida Laboral", category: .workLife)
    ]
    
    func addPlace(name: String, category: PlaceCategory) {
        let newPlace = Place(name: name, category: category)
        places.append(newPlace)
    }
}
