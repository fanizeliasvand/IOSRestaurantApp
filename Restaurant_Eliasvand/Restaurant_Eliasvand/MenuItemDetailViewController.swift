//
//  MenuItemDetailViewController.swift
//  Restaurant_Eliasvand
//
//  Created by Faniz Eliasvand on 12/18/21.
//

import UIKit

class MenuItemDetailViewController: UITableViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!//
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    
    
    
    
    
    
    
    var menuItem: MenuItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToOrderButton.layer.cornerRadius = 5.0
        updateUI()
        
    }
    
    
    
    func updateUI() {
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        detailTextLabel.text = menuItem.detailText
        
        
        MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
               self.addToOrderButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
                self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
            MenuController.shared.order.menuItems.append(self.menuItem)
            
            }
        

    }
    

    

}

