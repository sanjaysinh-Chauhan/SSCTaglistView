//
//  CloseButton.swift
//  TaglistCollectionDemo
//
//  Created by Sanjaysinh Chauhan on 01/12/17.
//  Copyright © 2017 Sanjaysinh Chauhan. All rights reserved.
//

import UIKit
import Foundation
class CloseButton: UIButton {

    // Varable declaration
    var closeView : CloseView?
    
    /// close button tint color
    public var tintcolor : UIColor = UIColor.clear {
        didSet {
            closeView?.strokColor = self.tintcolor
        }
    }
    
    override func draw(_ rect: CGRect) {
        self.drawCloseIcon()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    /// Draw cross icon with bazierpath
    func drawCloseIcon() {
        if self.subviews.count == 0
        {
            closeView = CloseView(frame: CGRect(x: 0.0, y: 0.0, width: Theme.shared.closeIconWidth, height: Theme.shared.closeIconHeight))
            closeView?.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
            self.addSubview(closeView!)
        }
    }
}

//MARK: - cross view -
class CloseView : UIView {
    
    // Variables
    let lineShape = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        self.drawCloseView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
    }
    convenience init(frame: CGRect, strokColor : UIColor) {
        self.init(frame: frame)
        self.strokColor = strokColor
    }
    
    /// Strok color of cross
    var strokColor = Theme.shared.closeIconTint{
        didSet {
            self.lineShape.strokeColor = strokColor.cgColor
        }
    }
    
    func drawCloseView() {

        // 1. set Interaction Enabled fasle
        self.isUserInteractionEnabled = false
        
        // 2. create bezier path
        let beziarPath = UIBezierPath()
        beziarPath.move(to: CGPoint(x: 0, y: 0))
        beziarPath.addLine(to: CGPoint(x: self.frame.size.width , y: self.frame.size.height))
        beziarPath.move(to: CGPoint(x: 0, y: self.frame.size.height))
        beziarPath.addLine(to: CGPoint(x: self.frame.size.width , y: 0))

        // 3. set line width and color
        UIColor.red.setStroke()
        beziarPath.lineWidth = 1.0
        beziarPath.close()
        
        // 4. set line stroke color
        lineShape.path = beziarPath.cgPath
        lineShape.strokeColor = strokColor.cgColor
        
        // 5. add line into layer
        self.layer.addSublayer(lineShape)
    }

}


