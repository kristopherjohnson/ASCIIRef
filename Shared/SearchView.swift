//
//  SearchView.swift
//  ASCIIRef
//

import SwiftUI

/**
 View model for `SearchView`.

 Keeps the list of matches synchronized with the current search text
 */
class SearchViewModel: ObservableObject {
    /**
     Text bound to the Search text field.

     When this changes, `matches` will be updated.
     */
    @Published var searchText = "" {
        didSet {
            matches = SearchViewModel.matchingAsciiCodes(
                searchText: searchText)
        }
    }

    /**
     List of matching codes to be displayed in the list.
     */
    @Published var matches = asciiCodes

    /**
     Given `searchText`, return array of `Ascii` codes that match.

     If `searchText` is empty or all-whitespace, returns all codes.
     */
    static func matchingAsciiCodes(searchText: String) -> [Ascii] {
        let terms = searchText.components(separatedBy: .whitespaces)
            .filter { $0.count > 0 }
        if terms.count == 0 {
            return asciiCodes
        }
        return asciiCodes.filter { $0.matches(terms: terms) }
    }
}

/**
 Displays a search text field and list of matching ASCII codes.

 - todo: We should automatically set the keyboard focus to the Search text field when this view is shown, but SwiftUI currently doesn't provide a way to do that other than via UIKit-integration tricks.
 */
struct SearchView: View {
    @Binding var isPresented: Bool
    @ObservedObject var model = SearchViewModel()

    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 4.0)
                    TextField("Search", text: $model.searchText)
                }
                .padding(8.0)
                .background(Color("SearchTextFieldBackground"))
                .cornerRadius(16.0)

                Button(action: onCloseTapped) {
                    Text("Close")
                }
            }
            .padding([.top, .leading, .trailing])

            Divider()

            List {
                if (model.matches.count > 0) {
                    ForEach(model.matches) { code in
                        AsciiRow(ascii: code)
                    }
                } else {
                    Text("No matches")
                        .italic()
                }
            }
        }
    }

    func onCloseTapped() {
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
