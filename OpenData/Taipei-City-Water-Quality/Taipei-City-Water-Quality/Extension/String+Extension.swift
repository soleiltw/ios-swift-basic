//
//  String+Extension.swift
//  Taipei-City-Water-Quality
//
//  Created by Edward Chiang on 22/10/2017.
//  Copyright © 2017 Soleil Software Studio Inc. All rights reserved.
//

import Foundation

extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
