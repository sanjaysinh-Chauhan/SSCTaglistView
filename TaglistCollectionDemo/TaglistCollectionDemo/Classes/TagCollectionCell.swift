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
    var objTagName : String!
    
    var indexPath : IndexPath!
    
    @IBOutlet var btnRemoveTag: UIButton!
    
    var delegate : TagColllectionCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblTag.backgroundColor = UIColor.clear
        self.backgroundColor = Theme.shared.cellBackGroundColor
        self.lblTag.textColor = Theme.shared.tagTextColor
        self.lblTag.font = Theme.shared.textFont
        self.viewTag.backgroundColor = Theme.shared.tagBackgroundColor
        self.viewTag.layer.cornerRadius = 15.0
        
        
        
        if (Theme.shared.isShadowEnabled == true) {
            
            self.viewTag.layer.masksToBounds = false
            self.viewTag.layer.shadowRadius = Theme.shared.tagShadowRadius
            self.viewTag.layer.shadowOpacity = Theme.shared.tagShadowOpacity
            self.viewTag.layer.shadowOffset = CGSize.zero
            self.viewTag.layer.shadowColor = Theme.shared.tagShadowColor.cgColor
        }
        else {
            self.viewTag.layer.borderWidth = Theme.shared.tagBorderWidht
            self.viewTag.layer.borderColor = Theme.shared.tagBorderColor.cgColor
        }
        
    }
    
    func configureCell() {
        
        self.lblTag.text = objTagName

        if(Theme.shared.isDeleteEnabled == false) {
            self.btnRemoveTag.removeFromSuperview()
        }

        
    }

    @IBAction func removeAction(_ sender: UIButton) {
        self.delegate.removeTagAt(indexPath: self.indexPath)
    }
}

