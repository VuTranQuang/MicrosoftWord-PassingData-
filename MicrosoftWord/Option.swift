//
//  Option.swift
//  MicrosoftWord
//
//  Created by RTC-HN154 on 10/9/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class OptionFont {
    static let shared = OptionFont()
    var size: Int?
    var fontName: String?
    var color: UIColor?
    var alignment: Int!
    init(size: Int, fontName: String, color: UIColor, alignment: Int) {
        self.size = size
        self.fontName = fontName
        self.color = color
        self.alignment = alignment
    }
    init() {
    }
    
}
