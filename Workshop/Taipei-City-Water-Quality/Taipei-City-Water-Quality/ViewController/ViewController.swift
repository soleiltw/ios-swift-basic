//
//  ViewController.swift
//  Taipei-City-Water-Quality
//
//  Created by Edward Chiang on 21/10/2017.
//  Copyright © 2017 Soleil Software Studio Inc. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate {
    
    // Networking
    let openDataURL : URL = URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=190796c8-7c56-42e0-8068-39242b8ec927")!
    
    // Swift Basic
    var stations = [Station]()
    
    // UIKit
    @IBOutlet weak var topBackgroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // MapKit
    @IBOutlet weak var mapView: MKMapView!
    
    // UIKit
    var refreshControl : UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // UIKit
        // Handle display
        self.topBackgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.topBackgroundView.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        self.topBackgroundView.layer.shadowOpacity = 1
        self.topBackgroundView.clipsToBounds = false
        
        if refreshControl == nil {
            refreshControl = UIRefreshControl()
        }
        refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl?.addTarget(self, action: #selector(reload(sender:)) , for: .valueChanged)
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 145
        
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refreshControl
        } else {
            self.tableView.addSubview(refreshControl!)
        }

        self.reload(sender: self.refreshControl!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func reload(sender : AnyObject) {
        // Networking
        let urlRequest = URLRequest(url: openDataURL as URL, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let data = data {
                do {
                    // Serialized from data into Dictionary
                    let dic : Dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, AnyObject>
                    
                    // Get result from json content
                    let result = dic["result"]
                    
                    // Get the results core value we want
                    let results : Array = result!["results"] as! Array<Dictionary<String, AnyObject>>
                    
                    self.stations.removeAll()
                    results.forEach({ (object) -> () in
                        let station : Station = Station.populate(dictionary: object)
                        self.stations.append(station)
                        
                        // MapKit
                        // Drop a pin at user's Current Location
                        let stationAnnotation: MKPointAnnotation = MKPointAnnotation()
                        stationAnnotation.coordinate = CLLocationCoordinate2DMake(Double(station.latitude)!, Double(station.longitude)!);
                        stationAnnotation.title = station.codeName
                        if (station.checkPh() == .normal) && (station.checkCl() == .normal) && (station.checkCntu() == .normal) {
                            stationAnnotation.subtitle = "Normal"
                        }
                        self.mapView.addAnnotation(stationAnnotation)
                    })
                    // UIKit
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.refreshControl?.endRefreshing()
                    }
                    
                } catch {
                    
                }
            }
        }
        task.resume()
    }
    
    @IBAction func segmentedValueChanged(_ sender: Any) {
        // UIKit
        let segmentControl : UISegmentedControl = sender as! UISegmentedControl
        switch segmentControl.selectedSegmentIndex {
        case 1:
            self.tableView.isHidden = true
            self.mapView.isHidden = false
            self.mapView.showAnnotations(self.mapView.annotations, animated: true)
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
        
        let station : Station = self.stations[indexPath.row]
        
        let stationCell : StationViewCell = cell as! StationViewCell
        stationCell.quaIdLabel.text = station.quaId.trim()
        stationCell.codeNameLabel.text = station.codeName.trim()
        stationCell.phValueLabel.text = station.quaPh
        stationCell.mglValueLabel.text = station.quaCl
        
        stationCell.ntuValueLabel.text = station.quaCntu
        if station.checkCntu() == .normal {
            stationCell.ntuValueLabel.textColor = UIColor.blue
        }
        if station.checkCl() == .normal {
            stationCell.mglValueLabel.textColor = UIColor.blue
        }
        if station.checkPh() == .normal {
            stationCell.phValueLabel.textColor = UIColor.blue
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (self.stations.count > 0) {
            return "\(self.stations[0].updateDate) \(self.stations[0].updateTime)"
        }
        return nil
    }
}

