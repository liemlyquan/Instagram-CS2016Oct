//
//  PhotosTableViewCell.swift
//  Instagram-CS2016Oct
//
//  Created by Pj on 10/12/16.
//  Copyright © 2016 coderschool. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
