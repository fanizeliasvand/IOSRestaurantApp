//
//  MenuTableViewController.swift
//  Restaurant_Eliasvand
//
//  Created by Faniz Eliasvand on 12/18/21.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    let menuController = MenuController()
    var menuItems = [MenuItem]()
    var category: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.capitalized
                menuController.fetchMenuItems(forCategory: category) { (menuItems) in
                    if let menuItems = menuItems {
                        self.updateUI(with: menuItems)
                    }
                }
       
    }

    func updateUI(with menuItems: [MenuItem]) {
            DispatchQueue.main.async {
                self.menuItems = menuItems
                self.tableView.reloadData()
            }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCellIdentifier", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }

    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = "$\(menuItem.price)"
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
        
        MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    if let currentIndexPath = self.tableView.indexPath(for: cell),
                        currentIndexPath != indexPath {
                        return
                    }
                    cell.imageView?.image = image
                    cell.setNeedsLayout()
                }
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuDetailSegue" {
            let menuItemDetailViewController = segue.destination as! MenuItemDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuItemDetailViewController.menuItem = menuItems[index]
        }
    }
    
    
    
    
}
