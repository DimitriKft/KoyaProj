//
//  ContentView.swift
//  KoyaProj
//
//  Created by dimitri on 08/12/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct WodsListView: View {
    @ObservedObject private var viewModel = WodsViewModel()
    
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.wods) { wod in
                    VStack {
                        if let imageUrl = URL(string: wod.image) {
                            AsyncImage(url: imageUrl) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 150, height: 150)
                                case .success(let image):
                                    image.resizable()
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 137, height: 100)
                                        .clipped()
                                        .cornerRadius(30)
                                case .failure:
                                    Image(systemName: "photo")
                                        .frame(width: 150, height: 150)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        } else {
                            Image(systemName: "photo")
                                .frame(width: 150, height: 150)
                        }
                        Text(wod.title)
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.horizontal)
        }
        .onAppear() {
            self.viewModel.fetchData()
        }
    }
}



#Preview {
    WodsListView()
}




