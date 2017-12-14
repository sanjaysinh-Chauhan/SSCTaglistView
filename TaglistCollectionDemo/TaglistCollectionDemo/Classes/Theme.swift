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
 
    var cellBackGroundColor     : UIColor!   // Background color of cell
    var textFont                : UIFont!    // Tag font
    var tagTextColor            : UIColor!   // Tag text color
    var tagBackgroundColor      : UIColor!   // Tag background color
    var tagBorderColor          : UIColor!   // Tag border color
    var tagBorderWidth          : CGFloat!   // Tag border width
    var tagShadowColor          : UIColor!   // Tag shadow color
    var tagShadowOpacity        : Float!     // Tag shadow opacity
    var tagShadowRadius         : CGFloat!   // Tag shadow radius
    
    var allowSingleSelection    : Bool!      // Allow single selection
    var allowMultipleSelection  : Bool!      // Allow multiple selection
    
    var selectionColor          : UIColor!   // Tag selection color
    var selectionTagTextColor   : UIColor!   // Tag selection text color
    
    
    var isShadowEnabled         : Bool!      // Tag shadow enable
    
    
    var isDeleteEnabled         : Bool!      // Tag able to delete
    var closeIconTint           = UIColor.green // Tag close icon tint color
    var selectionCloseIconTint  = UIColor.red   // Tag selection icon tint color
    var closeIconWidth: CGFloat = 13.0       // Close icon width
    var closeIconHeight:CGFloat = 13.0       // Close icon height
    static let shared           = Theme()    // shared instance 
}
