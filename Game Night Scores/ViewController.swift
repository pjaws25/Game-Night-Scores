//
//  ViewController.swift
//  Game Night Scores
//
//  Created by Peter Jaworski on 2/24/19.
//  Copyright © 2019 Peter Jaworski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
        var items = [Item]()
    
        
        @IBOutlet weak var listTableView: UITableView!
        @IBAction func addItem(_ sender: Any) {
            alert()
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            listTableView.dataSource = self
            
            //Need JSONDecoder for RETRIEVING
            do {
                if let data = UserDefaults.standard.data(forKey:"items") {
                    items = try JSONDecoder().decode([Item].self, from: data)
                }
            } catch { print(error) }
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PointsCell
            let item = items[indexPath.row]
            
            cell.textLabel?.text = item.name
            cell.scoreUILabel.text = "\(String(describing: item.points))"
            
            
            // create auto ID for points and save initial point value to firebase database
            
            // assign parameter to cell and say that if button is pressed, increase points of this item and reload this row.
            cell.buttonPressed = { // this gets called when `buttonPressed?()` is called from cell class
                self.items[indexPath.row].points += 1
                
                tableView.reloadRows(at: [indexPath], with: .automatic)
                self.saveData()
                
            }
            
            return cell
            
        }
        
        
        //Since Codable is used to encode and decode custom model to UserDefaults. - Need JSONEncoder SAVING
        func saveData() {
            do {
                let encoded = try JSONEncoder().encode(items)
                UserDefaults.standard.set(encoded, forKey: "items")
            } catch { print(error) }
        }
        
        
        func alert() {
            let alert = UIAlertController(title: "Add Player", message: "", preferredStyle: .alert)
            alert.addTextField{
                (textfield) in
                textfield.placeholder = " Enter Player Name "
                
            }
            let add = UIAlertAction(title: "Add", style: .default)
            {
                
                (action) in guard let textfield = alert.textFields?.first else {return}
                
                self.items.append(Item(name: textfield.text!))
                self.saveData()
                let indexPath = IndexPath(row: self.items.count - 1, section: 0)
                self.listTableView.insertRows(at: [indexPath], with: .automatic)
                
                
                
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) {
                (alert) in
                
            }
            
            alert.addAction(add)
            alert.addAction(cancel)
            
            present(alert, animated: true, completion: nil)
            
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            saveData()
            
        }
        
}
