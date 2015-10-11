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
    @IBOutlet weak var shotName: UILabel!
    @IBOutlet weak var designerName: UILabel!
    @IBOutlet weak var designerIcon: UIImageView!
    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet weak var viewUnitLabel: UILabel!

//    @IBOutlet weak var animatedImageView: FLAnimatedImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = true
        
        shotName.textColor = UIColor.cellLabelColor()
        designerName.textColor = UIColor.cellLabelColor()
        viewLabel.textColor = UIColor.cellLabelColor()
        viewUnitLabel.textColor = UIColor.cellLabelColor()
    }
}
