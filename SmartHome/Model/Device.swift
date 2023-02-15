//
//  Device.swift
//  SmartHome
//
//  Created by Matthew Hill on 2/15/23.
//

import Foundation

class Device {
    let name: String
    var isOn: Bool
    
    init(name: String, isOn: Bool = false) {
        self.name = name
        self.isOn = isOn
    }
}
