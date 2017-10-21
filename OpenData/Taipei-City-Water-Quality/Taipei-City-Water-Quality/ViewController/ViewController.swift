//
//  ViewController.swift
//  Taipei-City-Water-Quality
//
//  Created by Edward Chiang on 21/10/2017.
//  Copyright © 2017 Soleil Software Studio Inc. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var stations = [Station]()
    
    @IBOutlet weak var topBackgroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.topBackgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.topBackgroundView.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        self.topBackgroundView.layer.shadowOpacity = 1
        self.topBackgroundView.clipsToBounds = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedValueChanged(_ sender: Any) {
        let segmentControl : UISegmentedControl = sender as! UISegmentedControl
        switch segmentControl.selectedSegmentIndex {
        case 1:
            self.tableView.isHidden = true
            self.mapView.isHidden = false
            break
        default:
            self.tableView.isHidden = false
            self.mapView.isHidden = true
            break
        }
    }

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationInfoCell", for: indexPath)
        
        return cell
    }
}

