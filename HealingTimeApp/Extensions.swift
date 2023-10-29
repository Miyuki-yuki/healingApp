//
//  Extensions.swift
//  HealingTimeApp
//
//  Created by Miyuki Kikuchi on 29/10/2023.
//

import Foundation

extension DateComponentsFormatter {
    static let abbreviated: DateComponentsFormatter = {
        print("Initializing DateComponentsFormatter.shortened")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        
        return formatter
    }()
    
    static let positional: DateComponentsFormatter = {
        print("Initializing DateComponentsFormatter.shortened")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
    }()
}
