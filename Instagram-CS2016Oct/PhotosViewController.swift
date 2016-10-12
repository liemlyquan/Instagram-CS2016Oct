//
//  PhotosViewController.swift
//  Instagram-CS2016Oct
//
//  Created by Liem Ly Quan on 10/12/16.
//  Copyright © 2016 coderschool. All rights reserved.
//

import UIKit
import AFNetworking


class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var photos:[NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadPhotos()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPhotos(){
        let accessToken = "435569061.c66ada7.d12d19c8687e427591f254586e4f3e47"
        let userId = "435569061"
        let url = URL(string: "https://api.instagram.com/v1/users/\(userId)/media/recent/?access_token=\(accessToken)")
        
        if let url = url {
            let request = URLRequest(
                url: url,
                cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData,
                timeoutInterval: 10)
            let session = URLSession(
                configuration: URLSessionConfiguration.default,
                delegate: nil,
                delegateQueue: OperationQueue.main)
            let task = session.dataTask(
                with: request,
                completionHandler: { (dataOrNil, response, error) in
                    if let data = dataOrNil {
                        if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                            print("response: \(responseDictionary)")
                            if let photoData = responseDictionary["data"] as? [NSDictionary] {
                                self.photos = photoData
                                self.tableView.reloadData()
                                //self.refreshControl.endRefreshing()
                            }
                        }
                    }
            })
            task.resume()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell") as! PhotosTableViewCell
        let urlImages = photos[indexPath.row]["images"] as! NSDictionary
        let standarRes = urlImages["standard_resolution"] as! NSDictionary
        let urlString = standarRes["url"] as! String
        
        cell.photoImageView.setImageWith(URL(string: urlString)!)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! PhotoDetailsViewController
        var indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        let urlImages = photos[indexPath.row].value(forKeyPath: "images.standard_resolution.url")as! String
        vc.photoUrl = urlImages
    }
    
}

