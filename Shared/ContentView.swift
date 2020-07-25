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
        }.navigationViewStyle(StackNavigationViewStyle())
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
        let decimalColumnWidth: CGFloat = 50.0
        let descriptionColumnwidth: CGFloat = 50.0

        HStack(alignment: .lastTextBaseline) {
            Text(String(format: "%02X", ascii.id))
                .font(Font.headline.monospacedDigit())

            Text(String(format: "%3d", ascii.id))
                .font(Font.subheadline.monospacedDigit())
                .frame(width: decimalColumnWidth)

            HStack {
                if ascii.description.count > 1 {
                    Text(ascii.description)
                        .font(Font.subheadline.smallCaps().bold())
                } else {
                    Text(ascii.description)
                        .font(.headline)
                }
                Spacer()
            }
            .frame(width: descriptionColumnwidth)

            if let name = ascii.name {
                Text(name)
                    .font(.caption)
                    .lineLimit(1)
            }

            Spacer()

            if let escape = ascii.escape {
                Text("\(escape)")
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
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
