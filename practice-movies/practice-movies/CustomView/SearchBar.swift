//
//  SearchBar.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import SwiftUI

struct SearchBar: View {
    @State var text: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack{
            TextField("Search ...", text: $text)
                .focused($isFocused)
                .padding(8)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous))
                .padding(.horizontal, 8)
        }.foregroundStyle(.black).tint(.black)
    }
}

#Preview {
    SearchBar()
}
