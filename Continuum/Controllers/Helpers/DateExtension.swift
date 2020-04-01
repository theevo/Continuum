//
//  DateExtension.swift
//  Continuum
//
//  Created by Theo Vora on 3/31/20.
//  Copyright © 2020 studio awaken. All rights reserved.
//

import Foundation

extension Date {
    /**
    Formats a date into a string using dateStyle.short and timeStyle.short
     */
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
}
