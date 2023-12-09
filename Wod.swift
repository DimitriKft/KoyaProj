//
//  Wod.swift
//  KoyaProj
//
//  Created by dimitri on 09/12/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift



struct Wod: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var image: String
}
