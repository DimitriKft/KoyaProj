//
//  WodsViewModel.swift
//  KoyaProj
//
//  Created by dimitri on 08/12/2023.
//
//
import Foundation

import Firebase
import FirebaseFirestoreSwift


class WodsViewModel: ObservableObject {
    @Published var wods = [Wod]()

    private var db = Firestore.firestore()

    func fetchData() {
        db.collection("wods").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                print("Erreur obtention documents: \(error)")
                return
            }
            guard let documents = querySnapshot?.documents else {
                print("Aucun documents trouvé")
                return
            }
            self.wods = documents.compactMap { (queryDocumentSnapshot) -> Wod? in
                return try? queryDocumentSnapshot.data(as: Wod.self)
            }
            print("Récupération de \(self.wods.count) wods")
        }
    }
}

