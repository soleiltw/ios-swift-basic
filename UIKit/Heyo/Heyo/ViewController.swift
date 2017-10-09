//
//  ViewController.swift
//  Heyo
//
//  Created by Edward Chiang on 27/10/2016.
//  Copyright © 2016 TKU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.label.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(_ sender: AnyObject) {
        
        self.label.alpha = 1
        self.label.text = "哎呦"
        
        UIView.transition(with: self.label, duration: 2.0, options: .curveEaseIn, animations: {
            self.label.alpha = 0
            }, completion: nil)
    }

    
}

