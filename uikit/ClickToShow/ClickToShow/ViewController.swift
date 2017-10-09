//
//  ViewController.swift
//  ClickToShow
//
//  Created by Edward Chiang on 27/10/2016.
//  Copyright © 2016 TKU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.countLabel.text = String(self.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(_ sender: AnyObject) {
        self.label.text = "Hello!"
        self.count += 1
        self.countLabel.text = String(self.count)
    }
    
    @IBAction func resetClicked(_ sender: AnyObject) {
        self.count = 0
        self.countLabel.text = String(self.count)
    }
    
}

