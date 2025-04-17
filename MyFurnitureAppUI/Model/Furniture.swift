//
//  Furniture.swift
//  MyFurnitureAppUI
//
//  Created by Senla on 17.04.2025.
//

import SwiftUI

//MARK: Furniture Model And Sample Data
struct Furniture: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var image: String
    var subTitle: String
    var price: String
}

var furnitures: [Furniture] = [
    Furniture(title: "Royal Palm Sofa", image: "sofa.fill", subTitle: "Ergonomical for human body curve.", price: "$299"),
    Furniture(title: "Modern Sofa", image: "bed.double.fill", subTitle: "Extra comfy chair with a palm rest.", price: "$499"),
    Furniture(title: "Leather Sofa", image: "chair.lounge.fill", subTitle: "Ergonomical for human body curve.", price: "$199"),
    Furniture(title: "Luxury Sofa", image: "lamp.desk.fill", subTitle: "Extra comfy chair with a palm rest.", price: "$399"),
    Furniture(title: "Seto Sofa", image: "table.furniture.fill", subTitle: "Ergonomical for human body curve.", price: "$599")
]


