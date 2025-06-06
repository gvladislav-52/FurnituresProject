//
//  AppViewModel.swift
//  MyFurnitureAppUI
//
//  Created by Senla on 17.04.2025.
//

import SwiftUI

class AppViewModel: ObservableObject {
    //MARK: Properties
    @Published var currentTab: Tab = .home
    
    //MARK: Home Properties
    @Published var currentMenu: String = "All"
    
    //MARK: Detail View Properties
    
    @Published var showDetailView: Bool = false
    @Published var currentActiveItem: Furniture?
}
