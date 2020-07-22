//
//  Ascii.swift
//  ASCIIRef
//

import Foundation

/**
 Information about an ASCII character code.
 */
struct Ascii : Identifiable, CustomStringConvertible {
    /** Numeric code associated with character */
    let id: Int

    /** Glyph or abbreviation commonly used for the character. */
    let description: String

    /** Optional name for the character. */
    let name: String?

    /** Optional control key associated with the character. */
    let controlKey: String?

    /** Option C escape sequence for the character. */
    let escape: String?

    init(id: Int,
         description: String,
         name: String? = nil,
         controlKey: String? = nil,
         escape: String? = nil)
    {
        self.id = id
        self.description = description
        self.name = name
        self.controlKey = controlKey
        self.escape = escape
    }
}

struct AsciiCategory: Identifiable {
    let id: String
    let range: ClosedRange<Int>
}

/**
 Groupings of ASCII codes.

 Each element is a `(name, range)` pair.
 */
let asciiCategories = [
    AsciiCategory(id: "Control Characters (00-1F)", range:   0...31),
    AsciiCategory(id: "Punctuation (20-2F)",        range:  32...47),
    AsciiCategory(id: "Digits (30-39)",             range:  48...57),
    AsciiCategory(id: "Punctuation (3A-40)",        range:  58...64),
    AsciiCategory(id: "Uppercase Letters (41-5A)",  range:  65...90),
    AsciiCategory(id: "Punctuation (5B-60)",        range:  91...96),
    AsciiCategory(id: "Lowercase Letters (61-7A)",  range:  97...122),
    AsciiCategory(id: "Punctuation (7B-7E)",        range: 123...126),
    AsciiCategory(id: "Control Characters (7F)",    range: 127...127)
]

/** Array of all ASCII codes. */
let asciiCodes = [
    Ascii(id:   0, description: "NUL", name: "Null",                      controlKey: "@"),
    Ascii(id:   1, description: "SOH", name: "Start of Heading",          controlKey: "A"),
    Ascii(id:   2, description: "STX", name: "Start of Text",             controlKey: "B"),
    Ascii(id:   3, description: "ETX", name: "End of Text",               controlKey: "C"),
    Ascii(id:   4, description: "EOT", name: "End of Transmission",       controlKey: "D"),
    Ascii(id:   5, description: "ENQ", name: "Enquiry",                   controlKey: "E"),
    Ascii(id:   6, description: "ACK", name: "Acknowledgement",           controlKey: "F"),
    Ascii(id:   7, description: "BEL", name: "Bell",                      controlKey: "G", escape: "\\a"),
    Ascii(id:   8, description: "BS",  name: "Backspace",                 controlKey: "H", escape: "\\b"),
    Ascii(id:   9, description: "HT",  name: "Horizontal Tab",            controlKey: "I", escape: "\\t"),
    Ascii(id:  10, description: "LF",  name: "Line Feed",                 controlKey: "J", escape: "\\n"),
    Ascii(id:  11, description: "VT",  name: "Vertical Tab",              controlKey: "K", escape: "\\v"),
    Ascii(id:  12, description: "FF",  name: "Form Feed",                 controlKey: "L", escape: "\\f"),
    Ascii(id:  13, description: "CR",  name: "Carriage Return",           controlKey: "M", escape: "\\r"),
    Ascii(id:  14, description: "SO",  name: "Shift Out",                 controlKey: "N"),
    Ascii(id:  15, description: "SI",  name: "Shift In",                  controlKey: "O"),

    Ascii(id:  16, description: "DLE", name: "Data Link Escape",          controlKey: "P"),
    Ascii(id:  17, description: "DC1", name: "Device Control 1 (XON)",    controlKey: "Q"),
    Ascii(id:  18, description: "DC2", name: "Device Control 2",          controlKey: "R"),
    Ascii(id:  19, description: "DC3", name: "Device Control 3 (XOFF)",   controlKey: "S"),
    Ascii(id:  20, description: "DC4", name: "Device Control 4",          controlKey: "T"),
    Ascii(id:  21, description: "NAK", name: "Negative Acknowledgement",  controlKey: "U"),
    Ascii(id:  22, description: "SYN", name: "Synchronous Idle",          controlKey: "V"),
    Ascii(id:  23, description: "ETB", name: "End of Transmission Block", controlKey: "W"),
    Ascii(id:  24, description: "CAN", name: "Cancel",                    controlKey: "X"),
    Ascii(id:  25, description: "EM",  name: "End of Medium",             controlKey: "Y"),
    Ascii(id:  26, description: "SUB", name: "Substitute",                controlKey: "Z"),
    Ascii(id:  27, description: "ESC", name: "Escape",                    controlKey: "{"),
    Ascii(id:  28, description: "FS",  name: "File Separator",            controlKey: "\\"),
    Ascii(id:  29, description: "GS",  name: "Group Separator",           controlKey: "]"),
    Ascii(id:  30, description: "RS",  name: "Record Separator",          controlKey: "^"),
    Ascii(id:  31, description: "US",  name: "Unit Separator",            controlKey: "_"),

    Ascii(id:  32, description: "Space"),
    Ascii(id:  33, description: "!"),
    Ascii(id:  34, description: "\""),
    Ascii(id:  35, description: "#"),
    Ascii(id:  36, description: "$"),
    Ascii(id:  37, description: "%"),
    Ascii(id:  38, description: "&"),
    Ascii(id:  39, description: "'"),
    Ascii(id:  40, description: "("),
    Ascii(id:  41, description: ")"),
    Ascii(id:  42, description: "*"),
    Ascii(id:  43, description: "+"),
    Ascii(id:  44, description: ","),
    Ascii(id:  45, description: "/"),
    Ascii(id:  46, description: "."),
    Ascii(id:  47, description: "/"),

    Ascii(id:  48, description: "0"),
    Ascii(id:  49, description: "1"),
    Ascii(id:  50, description: "2"),
    Ascii(id:  51, description: "3"),
    Ascii(id:  52, description: "4"),
    Ascii(id:  53, description: "5"),
    Ascii(id:  54, description: "6"),
    Ascii(id:  55, description: "7"),
    Ascii(id:  56, description: "8"),
    Ascii(id:  57, description: "9"),

    Ascii(id:  58, description: ":"),
    Ascii(id:  59, description: ";"),
    Ascii(id:  60, description: "<"),
    Ascii(id:  61, description: "="),
    Ascii(id:  62, description: ">"),
    Ascii(id:  63, description: "?"),
    Ascii(id:  64, description: "@"),

    Ascii(id:  65, description: "A"),
    Ascii(id:  66, description: "B"),
    Ascii(id:  67, description: "C"),
    Ascii(id:  68, description: "D"),
    Ascii(id:  69, description: "E"),
    Ascii(id:  70, description: "F"),
    Ascii(id:  71, description: "G"),
    Ascii(id:  72, description: "H"),
    Ascii(id:  73, description: "I"),
    Ascii(id:  74, description: "J"),
    Ascii(id:  75, description: "K"),
    Ascii(id:  76, description: "L"),
    Ascii(id:  77, description: "M"),
    Ascii(id:  78, description: "N"),
    Ascii(id:  79, description: "O"),
    Ascii(id:  80, description: "P"),
    Ascii(id:  81, description: "Q"),
    Ascii(id:  82, description: "R"),
    Ascii(id:  83, description: "S"),
    Ascii(id:  84, description: "T"),
    Ascii(id:  85, description: "U"),
    Ascii(id:  86, description: "V"),
    Ascii(id:  87, description: "W"),
    Ascii(id:  88, description: "X"),
    Ascii(id:  89, description: "Y"),
    Ascii(id:  90, description: "Z"),

    Ascii(id:  91, description: "["),
    Ascii(id:  92, description: "\\"),
    Ascii(id:  93, description: "]"),
    Ascii(id:  94, description: "^"),
    Ascii(id:  95, description: "_"),
    Ascii(id:  96, description: "`"),

    Ascii(id:  97, description: "a"),
    Ascii(id:  98, description: "b"),
    Ascii(id:  99, description: "c"),
    Ascii(id: 100, description: "d"),
    Ascii(id: 101, description: "e"),
    Ascii(id: 102, description: "f"),
    Ascii(id: 103, description: "g"),
    Ascii(id: 104, description: "h"),
    Ascii(id: 105, description: "i"),
    Ascii(id: 106, description: "j"),
    Ascii(id: 107, description: "k"),
    Ascii(id: 108, description: "l"),
    Ascii(id: 109, description: "m"),
    Ascii(id: 110, description: "n"),
    Ascii(id: 111, description: "o"),
    Ascii(id: 112, description: "p"),
    Ascii(id: 113, description: "q"),
    Ascii(id: 114, description: "r"),
    Ascii(id: 115, description: "s"),
    Ascii(id: 116, description: "t"),
    Ascii(id: 117, description: "u"),
    Ascii(id: 118, description: "v"),
    Ascii(id: 119, description: "w"),
    Ascii(id: 120, description: "x"),
    Ascii(id: 121, description: "y"),
    Ascii(id: 122, description: "z"),

    Ascii(id: 123, description: "{"),
    Ascii(id: 124, description: "|"),
    Ascii(id: 125, description: "}"),
    Ascii(id: 126, description: "~"),

    Ascii(id: 127, description: "DEL", name: "Delete",                    controlKey: "_"),
]
