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
    var scores: [Score] // Supposons que vous avez un tableau de scores

    struct Score: Codable, Hashable {
        var date: Date
        var score: Int
    }

    // Calculer le meilleur score
    var bestScore: Int? {
        scores.max(by: { $0.score < $1.score })?.score
    }

    // Calculer le nombre de jours depuis le dernier score
    var daysSinceLastScore: Int? {
        guard let lastScoreDate = scores.sorted(by: { $0.date > $1.date }).first?.date else { return nil }
        return Calendar.current.dateComponents([.day], from: lastScoreDate, to: Date()).day
    }
}
