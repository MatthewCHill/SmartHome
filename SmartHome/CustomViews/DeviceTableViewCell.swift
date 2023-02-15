//
//  DeviceTableViewCell.swift
//  SmartHome
//
//  Created by Matthew Hill on 2/15/23.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    // MARK: - Outlets
    
    @IBOutlet weak var deviceNameLabel: UILabel!
    
    @IBOutlet weak var deviceToggleSwitch: UISwitch!
    
    // MARK: - Helper FUNCTIONS
    func updateViews(device: Device) {
        deviceNameLabel.text = device.name
        deviceToggleSwitch.isOn = device.isOn
    }
    
    
    
    // MARK: - Actions
    
    @IBAction func deviceToggled(_ sender: Any) {
    }
    
}
