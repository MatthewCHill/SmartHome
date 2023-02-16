//
//  DeviceController.swift
//  SmartHome
//
//  Created by Matthew Hill on 2/15/23.
//

import Foundation

class DeviceController {
    
    // MARK: - Properties
    static let shared = DeviceController() // Singleton
    
    var devices: [Device] = [] // SSOT
    
    init() {
        load()
    }
    
    // MARK: - CRUD Functions
    
    func create(name: String) {
        let device = Device(name: name)
        devices.append(device)
        save()
        
    }
    func delete(deviceToDelete: Device){
        guard let index = devices.firstIndex(of: deviceToDelete) else {return}
        devices.remove(at: index)
        save()
        
    }
    func toggleButtonSwitched(whatDevice: Device) {
        whatDevice.isOn.toggle()
        save()
    }
    func toggleAllDevicesOn(on: Bool) {
        devices.forEach { $0.isOn = on }
        save()
    }
    
    // MARK: - Persistence
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let finalURL = documentsDirectory.appendingPathComponent("devices.json")
        return finalURL
    }
    
    func save() {
        guard let url = fileURL else {return}
        do {
            let data = try JSONEncoder().encode(devices)
            try data.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }
        func load() {
            guard let url = fileURL else {return}
            do {
                let data = try Data(contentsOf: url)
                let devices = try JSONDecoder().decode([Device].self, from: data)
                self.devices = devices
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    

