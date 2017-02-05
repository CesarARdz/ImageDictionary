//
//  ImageViewCell.swift
//  ImageDictionary
//
//  Created by Cesar Rdz on 1/7/17.
//  Copyright © 2017 Cesar Rdz. All rights reserved.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var imageLabel: UILabel!
    
    override func awakeFromNib() {
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height*0.85))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        
        imageLabel = UILabel(frame: CGRect(x: 0, y: self.frame.height*0.85, width: self.frame.width, height: self.frame.height*0.15))
        //imageLabel.backgroundColor = UIColor.green
        imageLabel.textAlignment = .center
        imageLabel.textColor = UIColor.black
        contentView.addSubview(imageLabel)
    }
    
    override func prepareForReuse() {
        imageView.image = UIImage()
        imageLabel.text = String()
    }
}
