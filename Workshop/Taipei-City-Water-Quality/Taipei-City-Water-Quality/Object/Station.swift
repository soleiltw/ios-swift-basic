//
//  Station.swift
//  Taipei-City-Water-Quality
//
//  Created by Edward Chiang on 21/10/2017.
//  Copyright © 2017 Soleil Software Studio Inc. All rights reserved.
//
import Foundation

class Station {
    
    // Swift Advance
    enum WaterQuality {
        case normal, notNormal
    }
    
    // Swfit Basic
    var updateDate: String = ""
    var updateTime: String = ""
    var quaId: String = ""
    var codeName: String = ""
    var longitude: String = ""
    var latitude: String = ""
    var quaCntu: String = ""
    var quaCl: String = ""
    var quaPh: String = ""

    func init_populate(dictionary:Dictionary<String, Any>) {
        
        updateDate = dictionary["update_date"] as! String
        updateTime = dictionary["update_time"] as! String
        quaId = dictionary["qua_id"] as! String
        codeName = dictionary["code_name"] as! String
        longitude = dictionary["longitude"] as! String
        latitude = dictionary["latitude"] as! String
        quaCntu = dictionary["qua_cntu"] as! String
        quaCl = dictionary["qua_cl"] as! String
        quaPh = dictionary["qua_ph"] as! String
    }
    
    func checkCntu() -> WaterQuality {
        if Double(self.quaCntu)! < 0.3 {
            return .normal
        } else {
            return .notNormal
        }
    }
    
    func checkCl() -> WaterQuality {
        if Double(self.quaCl)! > 0.2 && Double(self.quaCl)! < 2.0 {
            return .normal
        } else {
            return .notNormal
        }
    }
    
    func checkPh() -> WaterQuality {
        if Double(self.quaPh)! > 6 && Double(self.quaPh)! < 8.5 {
            return .normal
        } else {
            return .notNormal
        }
    }
    
    class func DateFromString(dateString:String, timeString:String) -> Date
    {
        let dateFormatter = DateFormatter()
        
        let enUSPosixLocale = Locale(identifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale as Locale!
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: "\(dateString) \(timeString)")!
    }
    
    class func populate(dictionary:Dictionary<String, Any>) -> Station
    {
        let result = Station()
        result.init_populate(dictionary: dictionary)
        return result
    }
}
