//
//  ViewController.swift
//  GetData
//
//  Created by Edward Chiang on 25/11/2016.
//  Copyright © 2016 TKU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Download data only
//        self.downloadData()
        
        // Download image url
//        self.downloadImage()
        
        self.downloadImageWithProgress()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private
    
    func downloadData() {
        // Step 0. URL is ready.
        let url = URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=11930dc6-4092-4bde-a42c-7722e0416462")
        
        // Step 1. Prepare URL Request.
        let request = URLRequest(url: url!)
        
        // Step 2. Prepare url session using data task, put in request, wait for completion handler call back.
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            // Step 4. Check data is not nil
            if data != nil {
                do {
                    // Step 5. Serailize data to JSON Object.
                    let data : [String: AnyObject] = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
                    // Step 6. Move to 'result' data
                    let dataResultRootArray : [String: AnyObject] = data["result"] as! [String: AnyObject]
                    let dataResult : Array<[String: AnyObject]> = dataResultRootArray["results"] as! Array<[String: AnyObject]>
                    for eachDataInfo : [String: AnyObject] in dataResult {
                        print("Each data row id: \(eachDataInfo["_id"]!) lat, lon = \(eachDataInfo["LAT"]!), \(eachDataInfo["LON"]!) Name: \(eachDataInfo["ORG_NAME"] ?? "Empty name" as AnyObject)")
                    }
                } catch {
                    print("Error")
                }
            }
        })
        // Step 3. Call resume, will able to execute.
        task.resume()
    }
    
    func downloadImageWithProgress() {
        
        // Step 0. Prepaure your url
        let imageUrl = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Inveraray_Castle_-_south-west_facade.jpg/1200px-Inveraray_Castle_-_south-west_facade.jpg")
        
        // Step 1. Prepare URL session
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        // Step 2. Prepare download task
        let imageTask = session.downloadTask(with: imageUrl!)
        // Step 3. Call resume
        imageTask.resume()
        
    }

    func downloadImage() {
        // Step 0. Prepare our image url.
        let imageUrl = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Alcazar_de_Segovia.JPG/1200px-Alcazar_de_Segovia.JPG")
        // Step 1. Prepare URL request
        let imageRequest = URLRequest(url: imageUrl!)
        // Step 2. Put image request into URL Sesstion data task
        let imageTask = URLSession.shared.dataTask(with: imageRequest, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            // Step 4. Check data
            if data != nil {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }

            }
        })
        // Step 3. Execute
        imageTask.resume()
    }
    
    // MARK: - URLSessionDownloadDelegate
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
        
        print(String(format: "%.2f%%", progress * 100))
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let data = try! Data(contentsOf: location)

        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: data)
        }
    }
}

