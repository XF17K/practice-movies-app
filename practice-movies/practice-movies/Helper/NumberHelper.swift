//
//  NumberHelper.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 8.10.2023.
//

import Foundation

class NumberHelper{
    static let shared = NumberHelper()
    private init(){}
    
    func doubleFormat(number: Double, maxFractionDigits: Double? = 1) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        if let formattedString = formatter.string(from: NSNumber(value: number)){
            return formattedString
        }
        return "0"
    }
}
