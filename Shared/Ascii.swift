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

    /** Optional C Programming Language escape sequence for the character. */
    let cEscape: String?

    init(id: Int,
         description: String,
         name: String? = nil,
         controlKey: String? = nil,
         cEscape: String? = nil)
    {
        self.id = id
        self.description = description
        self.name = name
        self.controlKey = controlKey
        self.cEscape = cEscape
    }

    /**
     Determine whether this element matches a set of search terms.
     */
    func matches(terms: [String]) -> Bool {
        terms.allSatisfy { self.matches(term: $0) }
    }

    /**
     Determine whether this element matches a specified search term.

     - returns: `true` if any property contains `term` as a substring, or `false` if not.
     */
    func matches(term: String) -> Bool {
        let hexValue = String(format:"%02x", id)
        if hexValue.localizedCaseInsensitiveContains(term) {
            return true
        }

        let decimalValue = String(format:"%d", id)
        if decimalValue.localizedCaseInsensitiveContains(term) {
            return true
        }

        if description.localizedCaseInsensitiveContains(term) {
            return true
        }

        if let name = name {
            if name.localizedCaseInsensitiveContains(term) {
                return true
            }
        }

        if let controlKey = controlKey {
            let termToMatch = "^\(controlKey)"
            if termToMatch.localizedCaseInsensitiveContains(term) {
                return true
            }
        }

        if let cEscape = cEscape {
            if cEscape.localizedCaseInsensitiveContains(term) {
                return true
            }
        }

        return false
    }
}

/**
 A named range of ASCII code values.
 */
struct AsciiCategory: Identifiable {
    let id: String
    let range: ClosedRange<Int>
}

/**
 Groupings of ASCII codes.

 Each element is a `(name, range)` pair.
 */
let asciiCategories: [AsciiCategory] = [
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

/** Array of all 7-bit ASCII codes 1-127. */
let asciiCodes: [Ascii] = [
    Ascii(id:   0, description: "NUL", name: "Null",                      controlKey: "@"),
    Ascii(id:   1, description: "SOH", name: "Start of Heading",          controlKey: "A"),
    Ascii(id:   2, description: "STX", name: "Start of Text",             controlKey: "B"),
    Ascii(id:   3, description: "ETX", name: "End of Text",               controlKey: "C"),
    Ascii(id:   4, description: "EOT", name: "End of Transmission",       controlKey: "D"),
    Ascii(id:   5, description: "ENQ", name: "Enquiry",                   controlKey: "E"),
    Ascii(id:   6, description: "ACK", name: "Acknowledgement",           controlKey: "F"),
    Ascii(id:   7, description: "BEL", name: "Bell",                      controlKey: "G", cEscape: "\\a"),
    Ascii(id:   8, description: "BS",  name: "Backspace",                 controlKey: "H", cEscape: "\\b"),
    Ascii(id:   9, description: "HT",  name: "Horizontal Tab",            controlKey: "I", cEscape: "\\t"),
    Ascii(id:  10, description: "LF",  name: "Line Feed",                 controlKey: "J", cEscape: "\\n"),
    Ascii(id:  11, description: "VT",  name: "Vertical Tab",              controlKey: "K", cEscape: "\\v"),
    Ascii(id:  12, description: "FF",  name: "Form Feed",                 controlKey: "L", cEscape: "\\f"),
    Ascii(id:  13, description: "CR",  name: "Carriage Return",           controlKey: "M", cEscape: "\\r"),
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

    Ascii(id:  32, description: "␠",   name: "Space"),
    Ascii(id:  33, description: "!",   name: "Exclamation Point"),
    Ascii(id:  34, description: "\"",  name: "Double Quotes"),
    Ascii(id:  35, description: "#",   name: "Number Sign/Pound Sign"),
    Ascii(id:  36, description: "$",   name: "Dollar Sign"),
    Ascii(id:  37, description: "%",   name: "Percent Sign"),
    Ascii(id:  38, description: "&",   name: "Ampersand"),
    Ascii(id:  39, description: "'",   name: "Single Quote"),
    Ascii(id:  40, description: "(",   name: "Opening Parenthesis"),
    Ascii(id:  41, description: ")",   name: "Closing Parenthesis"),
    Ascii(id:  42, description: "*",   name: "Asterisk"),
    Ascii(id:  43, description: "+",   name: "Plus Sign"),
    Ascii(id:  44, description: ",",   name: "Comma"),
    Ascii(id:  45, description: "-",   name: "Minus Sign/Hyphen"),
    Ascii(id:  46, description: ".",   name: "Period"),
    Ascii(id:  47, description: "/",   name: "Slash"),

    Ascii(id:  48, description: "0",   name: "Zero"),
    Ascii(id:  49, description: "1",   name: "One"),
    Ascii(id:  50, description: "2",   name: "Two"),
    Ascii(id:  51, description: "3",   name: "Three"),
    Ascii(id:  52, description: "4",   name: "Four"),
    Ascii(id:  53, description: "5",   name: "Five"),
    Ascii(id:  54, description: "6",   name: "Six"),
    Ascii(id:  55, description: "7",   name: "Seven"),
    Ascii(id:  56, description: "8",   name: "Eight"),
    Ascii(id:  57, description: "9",   name: "Nine"),

    Ascii(id:  58, description: ":",   name: "Colon"),
    Ascii(id:  59, description: ";",   name: "Semicolon"),
    Ascii(id:  60, description: "<",   name: "Less-than Sign"),
    Ascii(id:  61, description: "=",   name: "Equal Sign"),
    Ascii(id:  62, description: ">",   name: "Greater-than Sign"),
    Ascii(id:  63, description: "?",   name: "Question Mark"),
    Ascii(id:  64, description: "@",   name: "At Symbol"),

    Ascii(id:  65, description: "A",   name: "Uppercase A"),
    Ascii(id:  66, description: "B",   name: "Uppercase B"),
    Ascii(id:  67, description: "C",   name: "Uppercase C"),
    Ascii(id:  68, description: "D",   name: "Uppercase D"),
    Ascii(id:  69, description: "E",   name: "Uppercase E"),
    Ascii(id:  70, description: "F",   name: "Uppercase F"),
    Ascii(id:  71, description: "G",   name: "Uppercase G"),
    Ascii(id:  72, description: "H",   name: "Uppercase H"),
    Ascii(id:  73, description: "I",   name: "Uppercase I"),
    Ascii(id:  74, description: "J",   name: "Uppercase J"),
    Ascii(id:  75, description: "K",   name: "Uppercase K"),
    Ascii(id:  76, description: "L",   name: "Uppercase L"),
    Ascii(id:  77, description: "M",   name: "Uppercase M"),
    Ascii(id:  78, description: "N",   name: "Uppercase N"),
    Ascii(id:  79, description: "O",   name: "Uppercase O"),
    Ascii(id:  80, description: "P",   name: "Uppercase P"),
    Ascii(id:  81, description: "Q",   name: "Uppercase Q"),
    Ascii(id:  82, description: "R",   name: "Uppercase R"),
    Ascii(id:  83, description: "S",   name: "Uppercase S"),
    Ascii(id:  84, description: "T",   name: "Uppercase T"),
    Ascii(id:  85, description: "U",   name: "Uppercase U"),
    Ascii(id:  86, description: "V",   name: "Uppercase V"),
    Ascii(id:  87, description: "W",   name: "Uppercase W"),
    Ascii(id:  88, description: "X",   name: "Uppercase X"),
    Ascii(id:  89, description: "Y",   name: "Uppercase Y"),
    Ascii(id:  90, description: "Z",   name: "Uppercase Z"),

    Ascii(id:  91, description: "[",   name: "Opening Square Bracket"),
    Ascii(id:  92, description: "\\",  name: "Backslash"),
    Ascii(id:  93, description: "]",   name: "Closing Square Bracket"),
    Ascii(id:  94, description: "^",   name: "Caret"),
    Ascii(id:  95, description: "_",   name: "Underscore"),
    Ascii(id:  96, description: "`",   name: "Backtick"),

    Ascii(id:  97, description: "a",   name: "Lowercase A"),
    Ascii(id:  98, description: "b",   name: "Lowercase B"),
    Ascii(id:  99, description: "c",   name: "Lowercase C"),
    Ascii(id: 100, description: "d",   name: "Lowercase D"),
    Ascii(id: 101, description: "e",   name: "Lowercase E"),
    Ascii(id: 102, description: "f",   name: "Lowercase F"),
    Ascii(id: 103, description: "g",   name: "Lowercase G"),
    Ascii(id: 104, description: "h",   name: "Lowercase H"),
    Ascii(id: 105, description: "i",   name: "Lowercase I"),
    Ascii(id: 106, description: "j",   name: "Lowercase J"),
    Ascii(id: 107, description: "k",   name: "Lowercase K"),
    Ascii(id: 108, description: "l",   name: "Lowercase L"),
    Ascii(id: 109, description: "m",   name: "Lowercase M"),
    Ascii(id: 110, description: "n",   name: "Lowercase N"),
    Ascii(id: 111, description: "o",   name: "Lowercase O"),
    Ascii(id: 112, description: "p",   name: "Lowercase P"),
    Ascii(id: 113, description: "q",   name: "Lowercase Q"),
    Ascii(id: 114, description: "r",   name: "Lowercase R"),
    Ascii(id: 115, description: "s",   name: "Lowercase S"),
    Ascii(id: 116, description: "t",   name: "Lowercase T"),
    Ascii(id: 117, description: "u",   name: "Lowercase U"),
    Ascii(id: 118, description: "v",   name: "Lowercase V"),
    Ascii(id: 119, description: "w",   name: "Lowercase W"),
    Ascii(id: 120, description: "x",   name: "Lowercase X"),
    Ascii(id: 121, description: "y",   name: "Lowercase Y"),
    Ascii(id: 122, description: "z",   name: "Lowercase Z"),

    Ascii(id: 123, description: "{",   name: "Opening Curly Brace"),
    Ascii(id: 124, description: "|",   name: "Vertical Bar"),
    Ascii(id: 125, description: "}",   name: "Closing Curly Brace"),
    Ascii(id: 126, description: "~",   name: "Tilde"),

    Ascii(id: 127, description: "DEL", name: "Delete", controlKey: "_"),
]
