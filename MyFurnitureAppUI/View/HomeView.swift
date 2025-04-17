//
//  HomeView.swift
//  MyFurnitureAppUI
//
//  Created by Senla on 17.04.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appModel: AppViewModel
    var animation: Namespace.ID
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15){
                VStack(alignment: .leading, spacing: 8) {
                    Text("Best Furniture")
                        .font(.title.bold())
                    
                    Text("Perfect Choice!")
                }
                
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack (spacing: 10) {
                    //MARK: Search Bar
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                        
                        TextField("Search", text: .constant(""))
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .background{
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.white)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "text.alignleft")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.white)
                            }
                    }
                }
                
                //MARK: Furnitures view
                ForEach(furnitures) { furniture in
                    CardView(furniture: furniture)
                }
                
            }
            .padding()
            //MARK: For Bottom Tab Bar
            .padding(.bottom, 100)
        }
    }
    
    //MARK: Furniture Card View
    @ViewBuilder
    func CardView(furniture: Furniture)-> some View {
        HStack(spacing: 12) {
            Image(systemName: furniture.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120)
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.quaternary)
                }
            
            VStack(alignment: .leading, spacing: 10) {
                Text (furniture.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.black)
                
                Text ("by Seto")
                    .font(.caption2.bold())
                    .foregroundColor(.gray)
                    .padding(.top, -5)
                
                Text (furniture.subTitle)
                    .font(.system(size: 14))
                    .foregroundColor(.black.opacity(0.8))
                
                HStack {
                    Text(furniture.price)
                        .font(.title3.bold())
                        .foregroundColor(.black)
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Buy")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background {
                                Capsule()
                                    .fill(.orange)
                            }
                            .scaleEffect(0.9)
                    }
                }
                .offset(y: 10)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
    
    @ViewBuilder
    func CustomMenu() -> some View {
        //MARK: Custom Menu With Matched Geometry Effect
        HStack(spacing: 0) {
            ForEach(["All", "Chair", "Table", "Lamp", "Floor"], id: \.self) { menu in
                Text(menu)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(appModel.currentMenu == menu ? .black : .white)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background {
                        if appModel.currentMenu == menu {
                            Capsule()
                                .fill(.orange)
                                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                                .matchedGeometryEffect(id: "MENU", in: animation)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            appModel.currentMenu = menu
                        }
                    }
            }
        }
        .padding(.top, 10)
        .padding(.bottom, 20)
    }
}
