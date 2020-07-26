//
//  AsciiRow.swift
//  ASCIIRef
//

import SwiftUI

/**
 List item row view for an `Ascii` struct.
 */
struct AsciiRow: View {
    let ascii: Ascii

    var body: some View {
        let decimalColumnWidth: CGFloat = 52.0
        let descriptionColumnwidth: CGFloat = 58.0

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

struct AsciiRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                Section(header: Text("Preview Items")) {
                AsciiRow(ascii: asciiCodes[9])
                AsciiRow(ascii: asciiCodes[32])
                AsciiRow(ascii: asciiCodes[50])
                    AsciiRow(ascii: asciiCodes[64])
                AsciiRow(ascii: asciiCodes[70])
                }
            }
            .navigationTitle("AsciiRow Preview")
        }
    }
}
