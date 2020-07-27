//
//  ContentView.swift
//  Shared
//

import SwiftUI

/**
 Main application view.
 */
struct ContentView: View {
    @State var searchViewIsPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(asciiCategories) { category in
                    Section(header: Text(category.id)) {
                        ForEach(asciiCodes[category.range]) { code in
                            AsciiRow(ascii: code)
                        }
                    }
                }
            }
            .navigationTitle("ASCII Reference")
            .navigationBarItems(
                trailing: Button(action: onSearchButtonTapped) {
                    Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $searchViewIsPresented) {
            SearchView(isPresented: $searchViewIsPresented)
        }
    }

    /**
     Called when the "Search" button is tapped. Shows the `SearchView` modally.
     */
    func onSearchButtonTapped() {
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
