//
//  Enum.swift
//  iOS-MVVM-DataBinding-Observable-Swift
//
//  Created by Hemant Pandagre on 23/06/22.
//

import Foundation
import UIKit

enum ColorType {
    case red
    case yellow
    case green
    var color: UIColor {
        switch self {
        case .red:
            return UIColor.red
        case .yellow:
            return UIColor.yellow
        case .green:
            return UIColor.green
        }
    }
}
