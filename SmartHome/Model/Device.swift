//
//  Device.swift
//  SmartHome
//
//  Created by Matthew Hill on 2/15/23.
//

import Foundation

class Device: Codable {
    var id: UUID
    let name: String
    var isOn: Bool
    
    init(id: UUID = UUID(),name: String, isOn: Bool = false) {
        self.id = id
        self.name = name
        self.isOn = isOn
    }
}
extension Device: Equatable {
    static func == (lhs: Device, rhs: Device) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}
