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

    var body: some View {
        NavigationView {
            List {
                ForEach(categories) { category in
                    Section(header: Text(category.id)) {
                        ForEach(codes[category.range]) { ascii in
                            AsciiRow(ascii: ascii)
                        }
                    }
                }
            }
            .navigationTitle("ASCII Reference")
            .navigationBarItems(trailing: Button(action: searchButtonTapped) {
                                    Image(systemName: "magnifyingglass")})
        }
    }

    func searchButtonTapped() {
        // TODO
    }
}

/**
 View for a single row in the list.
 */
struct AsciiRow: View {
    let ascii: Ascii

    var body: some View {
        HStack {
            HStack {
                Text(String(format: "%02X", ascii.id))
                    .font(Font.headline.monospacedDigit())
                Text(String(format: "%3d", ascii.id))
                    .font(Font.subheadline.monospacedDigit())
            }

            Text(ascii.description)
                .font(.headline)

            if let name = ascii.name {
                Text(name)
                    .font(.caption)
            }

            Spacer()

            if let escape = ascii.escape {
                Text("'\(escape)'")
                    .font(Font.system(.caption, design: .monospaced))
            }

            if let controlKey = ascii.controlKey {
                Text("^\(controlKey)")
                    .font(Font.system(.caption, design: .monospaced))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
