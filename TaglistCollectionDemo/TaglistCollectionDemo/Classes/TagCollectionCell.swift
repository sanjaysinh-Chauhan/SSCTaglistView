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
    
    // IBOutlets
    @IBOutlet var lblTag: UILabel!
    @IBOutlet var viewTag: UIView!
    @IBOutlet var btnRemoveTag: CloseButton!
    
    // Variables
    var objTagName : String!
    var isCellSelected : Bool!
    var indexPath : IndexPath!
    var delegate : TagColllectionCellDelegate!

    // IBActions
    @IBAction func removeAction(_ sender: CloseButton) {
        self.delegate.removeTagAt(indexPath: self.indexPath)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // initial setup
        self.lblTag.backgroundColor = UIColor.clear
        self.backgroundColor = Theme.shared.cellBackGroundColor
        self.lblTag.textColor = Theme.shared.tagTextColor
        self.lblTag.font = Theme.shared.textFont
        self.viewTag.backgroundColor = Theme.shared.tagBackgroundColor
        self.viewTag.layer.cornerRadius = 15.0
        self.viewTag.clipsToBounds = true

        // Apply theme
        if (Theme.shared.isShadowEnabled == true) {
            self.viewTag.layer.masksToBounds = false
            self.viewTag.layer.shadowRadius = Theme.shared.tagShadowRadius
            self.viewTag.layer.shadowOpacity = Theme.shared.tagShadowOpacity
            self.viewTag.layer.shadowOffset = CGSize.zero
            self.viewTag.layer.shadowColor = Theme.shared.tagShadowColor.cgColor
        }
        else {
            self.viewTag.layer.borderWidth = Theme.shared.tagBorderWidth
            self.viewTag.layer.borderColor = Theme.shared.tagBorderColor.cgColor
        }
        
    }
    
    /// Cell configuration
    func configureCell() {

        self.lblTag.text = objTagName
        if(Theme.shared.isDeleteEnabled == false) {
            self.btnRemoveTag.removeFromSuperview()
        }
        if(Theme.shared.isDeleteEnabled == true) {
            if(self.isCellSelected == true) {
                self.viewTag.backgroundColor = Theme.shared.selectionColor
                self.lblTag.textColor = Theme.shared.selectionTagTextColor
                self.btnRemoveTag.tintcolor = Theme.shared.selectionCloseIconTint
            }
            else {
                self.lblTag.textColor = Theme.shared.tagTextColor
                self.viewTag.backgroundColor = Theme.shared.tagBackgroundColor
                self.btnRemoveTag.tintcolor = Theme.shared.closeIconTint
            }
        }
    }

    
}

