//
//  Station.swift
//  Taipei-City-Water-Quality
//
//  Created by Edward Chiang on 25/10/2017.
//  Copyright © 2017 Soleil Software Studio Inc. All rights reserved.
//

import Foundation

class Station {
    
    enum WaterQualityResult {
        case normal
        case notNormal
    }
    
    var update_date : String = ""
    var update_time : String = ""
    var qua_id: String = ""
    var code_name: String = ""
    var longitude : String = ""
    var latitude : String = ""
    var qua_cntu : String = ""
    var qua_cl: String = ""
    var qua_ph: String = ""
    
    func initPopulate(dictionary:Dictionary<String, Any>) {
        update_time = dictionary["update_time"] as! String
        update_date = dictionary["update_date"] as! String
        qua_id = dictionary["qua_id"] as! String
        code_name = dictionary["code_name"] as! String
        longitude = dictionary["longitude"] as! String
        latitude = dictionary["latitude"] as! String
        qua_cntu = dictionary["qua_cntu"] as! String
        qua_cl = dictionary["qua_cl"] as! String
        qua_ph = dictionary["qua_ph"] as! String
    }
    
    func checkCntu() -> WaterQualityResult {
        if Double(self.qua_cntu)! < 0.3 {
            return .normal
        } else {
            return .notNormal
        }
    }
    
    func checkCl() -> WaterQualityResult {
        if Double(self.qua_cl)! > 0.2 && Double(self.qua_cl)! < 2.0 {
            return .normal
        } else {
            return .notNormal
        }
    }
    
    func checkPh() -> WaterQualityResult {
        if Double(self.qua_ph)! > 6 && Double(self.qua_ph)! < 8.5 {
            return .normal
        } else {
            return .notNormal
        }
    }
    
    class func dateFromString(date: String, time: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: "\(date) \(time)")
    }
    
    class func populate(dictInfo:Dictionary<String, Any>) -> Station {
        let result = Station()
        result.initPopulate(dictionary: dictInfo)
        return result
    }
}
