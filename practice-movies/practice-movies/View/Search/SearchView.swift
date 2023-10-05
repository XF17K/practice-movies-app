//
//  SearchView.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 5.10.2023.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                SearchBar().padding(8)
                Spacer()
            }
        }.foregroundStyle(.white)
    }
}

#Preview {
    SearchView()
}
