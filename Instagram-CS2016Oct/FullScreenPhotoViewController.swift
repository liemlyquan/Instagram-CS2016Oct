//
//  FullScreenPhotoViewController.swift
//  Instagram-CS2016Oct
//
//  Created by Pj on 10/12/16.
//  Copyright © 2016 coderschool. All rights reserved.
//

import UIKit

class FullScreenPhotoViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var imgZoom: UIImageView!
    var photo: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgZoom.image = photo
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgZoom
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
