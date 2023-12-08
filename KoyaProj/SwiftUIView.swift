//
//  SwiftUIView.swift
//  KoyaProj
//
//  Created by dimitri on 08/12/2023.
//

import SwiftUI

import SwiftUI

struct Test: View {
    @State var tests = [
        Testeu(title: "Restau1"),
        Testeu(title: "Restau2")
    ]

    var body: some View {
        List($tests) { $test in
            HStack {
                Text(test.title)
                Button(action: {
                    test.fav.toggle()
                }, label: {
                    Image(systemName: test.fav ? "heart.fill" : "heart")
                        .foregroundColor(test.fav ? .red : .none)
                })
            }
        }
    }
}

struct Testeu: Identifiable {
    var id = UUID()
    var title: String
    var fav: Bool = false
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

