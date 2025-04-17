//
//  MainView.swift
//  MyFurnitureAppUI
//
//  Created by Senla on 17.04.2025.
//

import SwiftUI

struct MainView: View {
    //MARK: View Properties
    @StateObject var appModel: AppViewModel = .init()
    
    //MARK: Animation Properties
    @Namespace var animation
    
    //MARK: Hiding Native Tab Bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $appModel.currentTab) {
            HomeView(animation: animation)
                .tag(Tab.home)
                .setUpTab()
                .background(.placeholder)
                .environmentObject(appModel)
            
            Text("Cart")
                .tag(Tab.cart)
                setUpTab()
            
            Text("Favourite")
                .tag(Tab.favourite)
                setUpTab()
            
            Text("Profile")
                .tag(Tab.profile)
                setUpTab()
        }
        .overlay(alignment: .bottom) {
            CustomTabBar(currentTab: $appModel.currentTab, animation: animation)
        }
    }
}

#Preview {
    MainView()
}


//MARK: Custom Extensions
extension View {
    @ViewBuilder
    func setUpTab() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
