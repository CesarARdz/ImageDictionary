//
//  ElementViewCell.swift
//  ImageDictionary
//
//  Created by Cesar Rdz on 1/23/17.
//  Copyright © 2017 Cesar Rdz. All rights reserved.
//

import UIKit

class ElementViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    var currentImage: UIImage?
    var currentName: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.image = currentImage
        labelName.text = currentName
    }

}
