//
//  HomeView.swift
//  MedHelp
//
//  Created by simge on 16.12.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText = ""
    var pills: [MedHelpModel]
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ZStack {
                        VStack(alignment: .leading) {
                            Text("İlacını içmeyi unutma")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, 16)
                                .padding(.leading)
                            HStack {
                                Text("4 gün")
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.black.opacity(0.24))
                                    )
                                    .frame(width: 100, height: 24)
                                Image("ilac")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(50)
                                    .padding([.bottom, .trailing], 1)
                                
                                
                            }
                            .padding(.bottom, 4)
                            
                            Text("Eczacını Ara")
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.black.opacity(0.24))
                                )
                                .frame(width: 150, height: 24)
                                .padding(.bottom)
                        }
                        .background(DarkBlue)
                        .cornerRadius(16)
                    }
                    .padding(10)
                    
                    ZStack {
                        VStack(alignment: .leading) {
                            Text("Randevun Yaklaşıyor")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, 16)
                                .padding(.leading)
                            HStack {
                                Text("1 gün")
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.black.opacity(0.24))
                                    )
                                    .frame(width: 100, height: 24)
                                Image("takvim")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(50)
                                    .padding(.bottom, 20)
                            }
                            .padding(.bottom, 4)
                            
                            Text("Takvime Git")
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.black.opacity(0.24))
                                )
                                .frame(width: 150, height: 24)
                                .padding(.bottom)
                        }
                        .frame( width: 180, height: 200)
                        
                        .background(DarkBlue)
                        .cornerRadius(16)
                        .shadow(color: LightBlue, radius: 6, x: 0.0, y: 0.0)
                    }
                }
                .padding(8)
                .navigationTitle("MedHelp")
                .searchable(text: $searchText, prompt: "Search")
                
                VStack (alignment: .leading) {
                    Text("İlaçlarım")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    ForEach(pills) { pill in
                        ToDoView(pill: pill)
                            .padding(1)
                    }
                }
            }
        }
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(pills: MedHelpModel.allPill)
    }
}
