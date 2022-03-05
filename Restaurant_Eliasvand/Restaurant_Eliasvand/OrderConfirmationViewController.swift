//
//  OrderConfirmationViewController.swift
//  Restaurant_Eliasvand
//
//  Created by Faniz Eliasvand on 12/22/21.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    @IBOutlet var timeRemainingLabel: UILabel!
    var minutes: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
    }
    
}
