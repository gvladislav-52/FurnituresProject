//
//  DetailView.swift
//  MyFurnitureAppUI
//
//  Created by Senla on 17.04.2025.
//

import SwiftUI

struct DetailView: View {
    var furniture: Furniture
    var animation: Namespace.ID
    @EnvironmentObject var appModel: AppViewModel
    
    //MARK: Animation Properties
    
    @State private var showDetailContent: Bool = false
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            VStack {
                //MARK: Custom Nav Bar
                HStack {
                    Button {
                        withAnimation(.easeInOut) {
                            showDetailContent = false
                        }
                        withAnimation(.easeInOut.delay(0.05)) {
                            appModel.showDetailView = false
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.yellow)
                            }
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.red)
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.yellow)
                            }
                    }
                    
                }
                .padding()
                .opacity(showDetailContent ? 1 : 0)
                
                Image(systemName: furniture.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //MARK: Matched Geometry Effect
                    .matchedGeometryEffect(id: furniture.id + "IMAGE",in: animation)
                    .frame(width: size.width/2)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(furniture.title)
                            .font(.title.bold())
                            .foregroundColor(.black)
                            .fixedSize()
                            .matchedGeometryEffect(id: furniture.id + "TITLE", in: animation)
                            .lineLimit(1)
                        
                        Text("by Seto")
                            .font(.caption2)
                            .bold()
                            .foregroundColor(.gray)
                            .fixedSize()
                            .matchedGeometryEffect(id: furniture.id + "SUBTITLE", in: animation)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, 35)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(.white)
                        .ignoresSafeArea()
                }
                .opacity(showDetailContent ? 1 : 0 )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .background{
            Color.white
                .ignoresSafeArea()
                .opacity(showDetailContent ? 1: 0)
        }
        
        .onAppear {
            withAnimation(.easeInOut) {
                showDetailContent = true
            }
        }
    }
}
