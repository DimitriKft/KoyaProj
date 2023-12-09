//
//  ContentView.swift
//  KoyaProj
//
//  Created by dimitri on 08/12/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct WodsView: View {
    @ObservedObject private var viewModel = WodsViewModel()

    var body: some View {
        List(viewModel.wods) { wod in
            VStack(alignment: .leading) {
                Text(wod.title).font(.headline)
               
            }
        }
        .onAppear() {
            self.viewModel.fetchData()
        }
    }
}



#Preview {
    WodsView()
}




