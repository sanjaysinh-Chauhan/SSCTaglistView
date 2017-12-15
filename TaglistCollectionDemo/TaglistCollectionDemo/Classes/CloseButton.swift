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

    var closeView : CloseView?
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

    
    func drawCloseIcon() {
        
        
        if self.subviews.count == 0
        {
            closeView = CloseView(frame: CGRect(x: 0.0, y: 0.0, width: Theme.shared.closeIconWidth, height: Theme.shared.closeIconHeight))
            
            closeView?.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
            
            self.addSubview(closeView!)
            
        }
    }
}

class CloseView : UIView {
    
    override func draw(_ rect: CGRect) {
        self.drawCloseView()
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
    }
    convenience init(frame: CGRect, strokColor : UIColor) {
        self.init(frame: frame)
        self.strokColor = strokColor
    }
    var strokColor = Theme.shared.closeIconTint{
        didSet {
            self.lineShape.strokeColor = strokColor.cgColor
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let lineShape = CAShapeLayer()
    func drawCloseView() {
        
        
        self.isUserInteractionEnabled = false
        
        let beziarPath = UIBezierPath()
        beziarPath.move(to: CGPoint(x: 0, y: 0))
        beziarPath.addLine(to: CGPoint(x: self.frame.size.width , y: self.frame.size.height))
        
        beziarPath.move(to: CGPoint(x: 0, y: self.frame.size.height))
        beziarPath.addLine(to: CGPoint(x: self.frame.size.width , y: 0))
        
        UIColor.red.setStroke()
        beziarPath.lineWidth = 1.0
        
        beziarPath.close()
        
        
        lineShape.path = beziarPath.cgPath
        
        
        lineShape.strokeColor = strokColor.cgColor
        
        self.layer.addSublayer(lineShape)
    }

}


