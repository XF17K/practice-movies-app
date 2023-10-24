//
//  DateFormatter.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 8.10.2023.
//

import Foundation

class DateFormatHelper{
    static var shared = DateFormatHelper()
    private init(){}
    
    func getYear(date: String) -> String?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: date){
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            return String(year)
        }
        return nil
    }
    
    func getRunTime(runTime: Int) -> String{
        let hours: Int = runTime / 60
        let minutes: Int = runTime % 60
        let hourString:String = addPluralSuffix(hours, singular: "Hour", plural: "Hours", type: .hour)
        let minuteString: String = addPluralSuffix(minutes, singular: "Minute", plural: "Minutes", type: .minute)
        
        return "\(hourString) \(minuteString)"
    }
    
    private func addPluralSuffix(_ value: Int, singular: String, plural: String, type: TimeType) -> String{
        
        if value == 0{
            return("\(type == .hour ? "" : "0 \(singular)")")
        }
        
        return ("\(value) \(value == 1 ? singular : plural)")
    }
    
    fileprivate enum TimeType{
        case hour
        case minute
    }
}
