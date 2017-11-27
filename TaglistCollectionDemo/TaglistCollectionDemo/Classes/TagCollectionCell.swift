//
//  TagCollectionCell.swift
//  TaglistCollectionDemo
//
//  Created by Sanjaysinh Chauhan on 17/11/17.
//  Copyright © 2017 Sanjaysinh Chauhan. All rights reserved.
//

import UIKit
protocol TagColllectionCellDelegate {
    func removeTagAt(indexPath : IndexPath)
}
class TagCollectionCell: UICollectionViewCell {
    @IBOutlet var lblTag: UILabel!
    @IBOutlet var viewTag: UIView!
    var arylist : [String]!
    var indexPath : IndexPath!
    var outerView : TaglistCollection!
    @IBOutlet var btnRemoveTag: UIButton!
    
    var delegate : TagColllectionCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()

        self.lblTag.backgroundColor = UIColor.clear
    }
    
    func configureCell() {
        self.lblTag.text = self.arylist[indexPath.row]
        if(self.outerView != nil) {
            self.backgroundColor = self.outerView.cellBackGroundColor
            self.lblTag.textColor = self.outerView.tagTextColor
            self.lblTag.font = self.outerView.tagFont
            self.viewTag.backgroundColor = self.outerView.tagBackgroundColor
            self.viewTag.layer.cornerRadius = 15.0
            
            
            self.viewTag.layer.borderWidth = self.outerView.tagBorderWidht
            self.viewTag.layer.borderColor = self.outerView.tagBorderColor.cgColor
            
            if(self.outerView.isDeleteEnabled == false) {
                self.btnRemoveTag.removeFromSuperview()
            }
            

        }
        
    }

    @IBAction func removeAction(_ sender: UIButton) {
        self.delegate.removeTagAt(indexPath: self.indexPath)
    }
}

