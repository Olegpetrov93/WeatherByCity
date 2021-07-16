//
//  Constant.swift
//  TestWeather
//
//  Created by Oleg on 7/16/21.
//

import UIKit

enum Constans {
    static var paragraphStyle: NSMutableParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.minimumLineHeight = 26
        paragraphStyle.tailIndent = 240
        paragraphStyle.firstLineHeadIndent = 5
        return paragraphStyle
    }
}
