//
//  KoyaProjApp.swift
//  KoyaProj
//
//  Created by dimitri on 08/12/2023.
//





     
import SwiftUI
import Firebase

@main
struct YourAppName: App {

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            WodsView()
        }
    }
}
