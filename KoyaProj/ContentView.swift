//
//  ContentView.swift
//  KoyaProj
//
//  Created by dimitri on 08/12/2023.
//

import SwiftUI


struct WODsView: View {
    @ObservedObject private var viewModel = WODsViewModel()

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
    WODsView()
}

import Firebase
import FirebaseFirestoreSwift

class WODsViewModel: ObservableObject {
    @Published var wods = [WOD]()

    private var db = Firestore.firestore()

    func fetchData() {
        db.collection("wods").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.wods = documents.compactMap { (queryDocumentSnapshot) -> WOD? in
                return try? queryDocumentSnapshot.data(as: WOD.self)
            }
            print("Loaded \(self.wods.count) wods")
        }
    }
}



struct WOD: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
 
    // Ajoutez d'autres propriétés selon la structure de vos documents Firestore
}


