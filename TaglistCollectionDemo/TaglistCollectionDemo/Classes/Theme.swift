//
//  Theme.swift
//  TaglistCollectionDemo
//
//  Created by Sanjaysinh Chauhan on 30/11/17.
//  Copyright © 2017 Sanjaysinh Chauhan. All rights reserved.
//

import Foundation
import UIKit

class Theme {
 
    var cellBackGroundColor : UIColor!
    var textFont :  UIFont!
    var tagTextColor : UIColor!
    var tagBackgroundColor : UIColor!
    var tagBorderColor : UIColor!
    
    var tagBorderWidht : CGFloat!
    var allowSingleSelection : Bool!
    var allowMultipleSelection : Bool!
    var selectionColor : UIColor!
    var selectionTagTextColor : UIColor!
    var isDeleteEnabled : Bool!
    var isShadowEnabled : Bool!
    
    var tagShadowColor : UIColor!
    var tagShadowOpacity : Float!
    var tagShadowRadius : CGFloat!
    
    var closeIconTint = UIColor.white
    var closeIconWidth : CGFloat = 13.0
    var closeIconHeight : CGFloat = 13.0
    static let shared = Theme()
}
