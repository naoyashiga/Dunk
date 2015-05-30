//
//  ShotCollectionViewCell.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit

class ShotCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

//    @IBOutlet weak var animatedImageView: FLAnimatedImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
    }
}
