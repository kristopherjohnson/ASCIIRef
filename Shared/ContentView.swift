//
//  ContentView.swift
//  Shared
//

import SwiftUI

/**
 Main application view.
 */
struct ContentView: View {
    @State var codes = asciiCodes
    @State var categories = asciiCategories
    @State var searchViewIsPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(categories) { category in
                    Section(header: Text(category.id)) {
                        ForEach(codes[category.range]) { code in
                            AsciiRow(ascii: code)
                        }
                    }
                }
            }
            .navigationTitle("ASCII Reference")
            .navigationBarItems(
                trailing: Button(action: searchButtonTapped) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $searchViewIsPresented) {
            SearchView(isPresented: $searchViewIsPresented)
        }
    }

    func searchButtonTapped() {
        searchViewIsPresented.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
