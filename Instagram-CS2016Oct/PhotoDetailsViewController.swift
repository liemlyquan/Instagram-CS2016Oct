//
//  PhotoDetailsViewController.swift
//  Instagram-CS2016Oct
//
//  Created by Liem Ly Quan on 10/12/16.
//  Copyright © 2016 coderschool. All rights reserved.
//

import UIKit
import AFNetworking
class PhotoDetailsViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!

    var photoUrl:String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        photoImageView.setImageWith(URL(string: photoUrl)!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
