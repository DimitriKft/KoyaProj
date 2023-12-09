//
//  WodDetailView.swift
//  KoyaProj
//
//  Created by dimitri on 10/12/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

// Vue de détail pour un WOD spécifique
struct WodDetailView: View {
    let wod: Wod

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let imageUrl = URL(string: wod.image) {
                    AsyncImage(url: imageUrl) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                Text(wod.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

           
            }
            .padding()
        }
    }
}

#Preview {
    WodDetailView(wod: Wod(id: "Id", title: "Title", image: "Image"))
}
