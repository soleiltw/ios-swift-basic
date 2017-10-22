//
//  ViewController.swift
//  HelloPageControl
//
//  Created by Edward Chiang on 27/10/2016.
//  Copyright © 2016 TKU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var leftGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var rightGestureRecognizer: UISwipeGestureRecognizer!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slideCount = 0
    
    let imageNames = ["Scene01", "Scene02", "Scene03"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imageView.isUserInteractionEnabled = true
        
        self.imageView.image = UIImage(named: imageNames[0])
        self.imageView.contentMode = .scaleAspectFill
        
        self.imageView.addGestureRecognizer(self.leftGestureRecognizer)
        self.imageView.addGestureRecognizer(self.rightGestureRecognizer)
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (timer) in
            self.slideCount += 1
            let swipeToIndex = self.slideCount % self.imageNames.count
            self.imageView.image = UIImage(named: self.imageNames[swipeToIndex])
            self.pageControl.currentPage = swipeToIndex
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func swipe(_ sender: AnyObject) {
        
        if let gesture : UISwipeGestureRecognizer = sender as? UISwipeGestureRecognizer {
            
            // From left to right
            if gesture.direction == .right {
                if self.pageControl.currentPage > 0 {
                    self.pageControl.currentPage -= 1
                    
                    self.imageView.image = UIImage(named: imageNames[self.pageControl.currentPage])
                }
            } else if gesture.direction == .left {
                if self.pageControl.currentPage < self.imageNames.count {
                    self.pageControl.currentPage += 1
                    
                    self.imageView.image = UIImage(named: imageNames[self.pageControl.currentPage])
                }
            }
        }
    }
    
}

