//
//  ViewController.swift
//  Taipei-City-Water-Quality
//
//  Created by Edward Chiang on 25/10/2017.
//  Copyright © 2017 Soleil Software Studio Inc. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var stations = [Station]()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mapView.isHidden = true
        
        // Show shadow under the top view
        self.topBackgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.topBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.topBackgroundView.layer.shadowOpacity = 1
        self.topBackgroundView.clipsToBounds = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentChanged(_ sender: Any) {
        let segmentControl : UISegmentedControl = sender as! UISegmentedControl
        
        switch segmentControl.selectedSegmentIndex {
        case 1:
            self.mapView.isHidden = false
            self.tableView.isHidden = true
            break
        default:
            self.mapView.isHidden = true
            self.tableView.isHidden = false
            break
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationCell", for: indexPath)
        
        let stationCell: StationCell = cell as! StationCell
        stationCell.idLabel.text = "1"
        stationCell.nameLabel.text = "淡水站"
        stationCell.ntuLabel.text = "-"
        stationCell.phLabel.text = "-"
        stationCell.mglLabel.text = "-"
        
        return cell
    }
}

