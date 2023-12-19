//
//  ContentView.swift
//  EmojiPicker
//
//  Created by Jeff Barra on 12/19/23.
//

import SwiftUI

// Emoji list as strings then allow loop over options
enum Emoji: String, CaseIterable {
    case 👍, 🤣, 🔥, 🚀
}

// What emoji will app open with initally?
struct ContentView: View {
    @State var selection: Emoji = .👍
    
    // Add title, body of current selection and picker
    var body: some View {
        NavigationView {
            VStack {
                Text(selection.rawValue)
                    .font(.system(size: 150))
                // Loop through selection list and then display the emoji with id of "self" (same as picker selection)
                Picker("Select Emoji", selection: $selection) {
                    ForEach(Emoji.allCases, id: \.self) {
                        emoji in Text(emoji.rawValue)
                    }

                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Emoji Picker")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
