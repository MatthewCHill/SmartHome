//
//  DevicesTableViewController.swift
//  SmartHome
//
//  Created by Matthew Hill on 2/15/23.
//

import UIKit

class DevicesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    
    @IBAction func addDeviceButtonTapped(_ sender: Any) {
        presentNewDeviceAlertController()
    }
    
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DeviceController.shared.devices.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as? DeviceTableViewCell else {return UITableViewCell()}
        let device = DeviceController.shared.devices[indexPath.row]
        cell.updateViews(device: device)
        
        cell.delegate = self
        // Configure the cell...

        return cell
    }
    



    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    private func presentNewDeviceAlertController() {
        let alertController = UIAlertController(title: "New Device", message: "Enter the name of your device below", preferredStyle: .alert)
        alertController.addTextField { textField in textField.placeholder = "New Device Name"
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(dismissAction)
        let confirmAction = UIAlertAction(title: "Create", style: .default)
        { _ in guard let contentTextField = alertController.textFields?.first,
            let name = contentTextField.text else {return}
            DeviceController.shared.create(name: name)
            self.tableView.reloadData()
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
}

extension DevicesTableViewController: DeviceTableViewCellDelegate {
    func isOnSwitchToggled(cell: DeviceTableViewCell) {
        guard let index = tableView.indexPath(for: cell) else {return}
        let device = DeviceController.shared.devices[index.row]
        DeviceController.shared.toggleButtonSwitched(whatDevice: device)
        cell.updateViews(device: device)
    }
    
    
}
