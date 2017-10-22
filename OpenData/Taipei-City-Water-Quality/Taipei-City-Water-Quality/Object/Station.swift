//
//  Station.swift
//  Taipei-City-Water-Quality
//
//  Created by Edward Chiang on 21/10/2017.
//  Copyright © 2017 Soleil Software Studio Inc. All rights reserved.
//
import Foundation

class Station {
    
    enum Result {
        case normal, notNormal
    }
    
    var update_date: String = ""
    var update_time: String = ""
    var qua_id: String = ""
    var code_name: String = ""
    var longitude: String = ""
    var latitude: String = ""
    var qua_cntu: String = ""
    var qua_cl: String = ""
    var qua_ph: String = ""

    func init_populate(dictionary:Dictionary<String, Any>) {
        
        update_date = dictionary["update_date"] as! String
        update_time = dictionary["update_time"] as! String
        qua_id = dictionary["qua_id"] as! String
        code_name = dictionary["code_name"] as! String
        longitude = dictionary["longitude"] as! String
        latitude = dictionary["latitude"] as! String
        qua_cntu = dictionary["qua_cntu"] as! String
        qua_cl = dictionary["qua_cl"] as! String
        qua_ph = dictionary["qua_ph"] as! String
    }
    
    func checkCntu() -> Result {
        if Double(self.qua_cntu)! < 0.3 {
            return .normal
        } else {
            return .notNormal
        }
    }
    
    func checkCl() -> Result {
        if Double(self.qua_cl)! > 0.2 && Double(self.qua_cl)! < 2.0 {
            return .normal
        } else {
            return .notNormal
        }
    }
    
    func checkPh() -> Result {
        if Double(self.qua_ph)! > 6 && Double(self.qua_ph)! < 8.5 {
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
