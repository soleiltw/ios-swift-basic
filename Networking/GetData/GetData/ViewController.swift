//
//  ViewController.swift
//  GetData
//
//  Created by Edward Chiang on 25/11/2016.
//  Copyright © 2016 TKU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDelegate, URLSessionDownloadDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Download data only
        self.downloadData()
        
        // Download image url
        self.downloadImage()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private
    
    func downloadData() {
        let url = URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=11930dc6-4092-4bde-a42c-7722e0416462")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            if data != nil {
//                print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue) ?? "data.taipei")
                
                do {
                    let data : [String: AnyObject] = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
                    let dataResultRootArray : [String: AnyObject] = data["result"] as! [String: AnyObject]
                    let dataResult : Array<[String: AnyObject]> = dataResultRootArray["results"] as! Array<[String: AnyObject]>
//                    print("Data serialization: \(dataResult)")
                    for eachDataInfo : [String: AnyObject] in dataResult {
                        print("Each data row id: \(eachDataInfo["_id"]!) lat, lon = \(eachDataInfo["LAT"]!), \(eachDataInfo["LON"]!)")
                    }
                } catch {
                    print("Error")
                }
            }
        })
        task.resume()
    }
    
    func downloadImageWithProgress() {
        
        let imageUrl = URL(string: "https://i.ytimg.com/vi/fz1cBwNEUXI/maxresdefault.jpg")
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        let imageTask = session.downloadTask(with: imageUrl!)
        
        imageTask.resume()
        
    }

    func downloadImage() {
        let imageUrl = URL(string: "https://i.ytimg.com/vi/fz1cBwNEUXI/maxresdefault.jpg")
        let imageRequest = URLRequest(url: imageUrl!)
        
        let imageTask = URLSession.shared.dataTask(with: imageRequest, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            if data != nil {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }

            }
        })
        imageTask.resume()
    }
    
    // MARK: - URLSessionDownloadDelegate
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
        
        print(String(format: "%.2f%%", progress * 100))
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        // The file “CFNetworkDownload_1SZyO3.tmp” couldn’t be opened because there is no such file.
    }
}

