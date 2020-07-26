//
//  SearchView.swift
//  ASCIIRef
//

import SwiftUI

/**
 Displays a search text field and list of matching ASCII codes.
 */
struct SearchView: View {
    @Binding var isPresented: Bool
    @State var searchText: String = ""
    @State var matchingCodes: [Ascii] = asciiCodes

    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 4.0)
                    TextField("Search", text: $searchText)
                }
                .padding(8.0)
                .background(Color("SearchTextFieldBackground"))
                .cornerRadius(16.0)

                Button(action: onCancelTapped) {
                    Text("Cancel")
                }
            }
            .padding()

            List(matchingCodes) { code in
                AsciiRow(ascii: code)
            }
        }
    }

    func onCancelTapped() {
        isPresented.toggle()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchView(isPresented: .constant(true))
            SearchView(isPresented: .constant(true))
                .preferredColorScheme(.dark)
        }
    }
}
