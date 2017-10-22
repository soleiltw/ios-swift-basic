//
//  ViewController.swift
//  HelloIndicator
//
//  Created by Edward Chiang on 27/10/2016.
//  Copyright © 2016 TKU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!

    var timer : Timer!
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.progressView.progress = 0
        self.progressView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animateClick(_ sender: AnyObject) {
        
        self.imageView.image = nil
        
        self.count = 0
        self.progressView.isHidden = false
        self.progressView.progress = 0
        self.activityIndicatorView.startAnimating()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            
            self.count += 1
            
            let progress = Float(self.count) / Float(3)
            self.progressView.progress = Float(progress)
            
            if self.count >= 3 {
                timer.invalidate()
            
                self.activityIndicatorView.stopAnimating()
                self.progressView.isHidden = true
            
                self.imageView.contentMode = .scaleAspectFill
                self.imageView.image = UIImage(named: "SceneImage")

            }
        })
    }
    
    
    
}

