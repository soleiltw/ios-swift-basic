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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let openDataURL : URL = URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=190796c8-7c56-42e0-8068-39242b8ec927")!
    
    var stations = [Station]()
    
    @IBOutlet weak var topBackgroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    var refreshControl : UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
                    })
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
        
        let station : Station = self.stations[indexPath.row]
        
        let stationCell : StationViewCell = cell as! StationViewCell
        stationCell.quaIdLabel.text = station.qua_id.trim()
        stationCell.quaIdLabel.sizeToFit()
//        stationCell.quaIdLabel.layoutIfNeeded()
        
        stationCell.codeNameLabel.text = station.code_name.trim()
        stationCell.codeNameLabel.sizeToFit()
//        stationCell.codeNameLabel.layoutIfNeeded()
        
        return cell
    }
}

