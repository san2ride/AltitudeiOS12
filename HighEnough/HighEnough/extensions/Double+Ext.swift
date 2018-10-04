//
//  Double+Ext.swift
//  HighEnough
//
//  Created by Jason Sanchez on 10/4/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import Foundation

extension Double {
    func rounded(toDecimalPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
