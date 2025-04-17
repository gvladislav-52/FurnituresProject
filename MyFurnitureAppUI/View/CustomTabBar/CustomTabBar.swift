//
//  CustomTabBar.swift
//  MaterialCurvedTabbarApp
//
//  Created by Senla on 17.04.2025.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab: Tab
    var animation: Namespace.ID
    
    @State var currentXValue: CGFloat = 0
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                let isSelected = currentTab == tab

                TabButton(tab: tab)
                    .overlay(
                        tabLabel(for: tab, isSelected: isSelected)
                    )
            }
        }
        .padding(.top)
        .padding(.bottom, getSafeArea().bottom == 0 ? 15 : 10)
        .background(
            Color.mint
                .shadow(color: .black.opacity(0.0), radius: 5, x: 0, y: -5)
                .clipShape(BottomCurve(currentXValue: currentXValue))
                .ignoresSafeArea(.container, edges: .bottom)
        )
    }
    @ViewBuilder
    private func tabLabel(for tab: Tab, isSelected: Bool) -> some View {
        Text(tab.title)
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.black)
            .offset(y: isSelected ? 15 : 100)
    }
    
    @ViewBuilder
    func SampleCards(color: Color, count: Int) -> some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(1...count, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 10)
                            .fill(color)
                            .frame(height: 250)
                    }
                }
                .padding()
                .padding(.bottom, 60)
                .padding(.bottom, getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
            }
            .navigationTitle("Home")
        }
    }
    
    @ViewBuilder
    func TabButton(tab: Tab) -> some View {
        GeometryReader { proxy in
            Button {
                withAnimation(.easeInOut) {
                    currentTab = tab
                    currentXValue = proxy.frame(in: .global).midX
                }
            } label: {
                Image(systemName: tab.rawValue)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(currentTab == tab ? .white : .black.opacity(0.8))
                    .padding(currentTab == tab ? 15 : 0)
                    .background(
                        ZStack {
                            if currentTab == tab {
                                Circle()
                                    .fill(.orange)
                                    .shadow(color: .black.opacity(0.1), radius: 8, x: 5, y: 5)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
                    .contentShape(Rectangle())
                    .offset(y: currentTab == tab ? -50 : 0)
                
                    .onAppear() {
                        if tab == Tab.allCases.first && currentXValue == 0 {
                            currentXValue = proxy.frame(in: .global).midX
                        }
                    }
            }
        }
        .frame(height: 30)
    }
}

enum Tab: String, CaseIterable {
    case home = "house.fill"
    case cart = "magnifyingglass"
    case favourite = "bell.fill"
    case profile = "person.fill"

    var title: String {
        switch self {
        case .home: return "Home"
        case .cart: return "Search"
        case .favourite: return "Notifications"
        case .profile: return "Profile"
        }
    }
}


extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}
