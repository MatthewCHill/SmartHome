//
//  ToggleAllDevicesViewController.swift
//  SmartHome
//
//  Created by Matthew Hill on 2/16/23.
//

import UIKit

class ToggleAllDevicesViewController: UIViewController {

// MARK: - Actions
    
    @IBAction func turnAllDevicesOn(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(Constants.Notifications.turnAllOn), object: nil)
    }
    
    
    @IBAction func turnAllDevicesOff(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(Constants.Notifications.turnAllOff), object: nil)
    }
}
