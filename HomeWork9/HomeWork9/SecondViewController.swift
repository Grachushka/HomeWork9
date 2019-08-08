//
//  SecondViewController.swift
//  HomeWork9
//
//  Created by Pavel Procenko on 08/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var i: Double = 0
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
        
            if i < 5 {
                
                i += 1
                
            } else {
                
                self.myActivityIndicator.stopAnimating()
            }
            
            
            self.myActivityIndicator.stopAnimating()
            
            self.view.backgroundColor = UIColor.white
            
            self.myLabel.isHidden = false
            
            self.myLabel2.isHidden = true
            
            }
        }
    }
    
   
    


