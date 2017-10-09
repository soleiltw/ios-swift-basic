//
//  ViewController.swift
//  ActionSheetColor
//
//  Created by Edward Chiang on 27/10/2016.
//  Copyright © 2016 TKU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func viewTap(_ sender: AnyObject) {
        
        let colorSheet = UIAlertController(title: "Change color", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        colorSheet.addAction(UIAlertAction(title: "Blue", style: .default, handler: { (alertAction) in
            self.view.backgroundColor = UIColor.blue
        }))
        colorSheet.addAction(UIAlertAction(title: "Green", style: .default, handler: { (alertAction) in
            self.view.backgroundColor = UIColor.green
        }))
        colorSheet.addAction(UIAlertAction(title: "Red", style: .default, handler: { (alertAction) in
            self.view.backgroundColor = UIColor.red
        }))
        colorSheet.addAction(UIAlertAction(title: "White", style: .default, handler: { (alertAction) in
            self.view.backgroundColor = UIColor.white
        }))
        colorSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (alertAction) in
            
        }))
        self.present(colorSheet, animated: true, completion: nil)
    }
    
}

