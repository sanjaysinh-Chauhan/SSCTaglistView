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
        
        let view = CloseView(frame: CGRect(x: 0.0, y: 0.0, width: Theme.shared.closeIconWidth, height: Theme.shared.closeIconHeight))
        
        view.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        self.addSubview(view)
        
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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
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
        
        let lineShape = CAShapeLayer()
        lineShape.path = beziarPath.cgPath
        lineShape.strokeColor = Theme.shared.closeIconTint.cgColor
        
        self.layer.addSublayer(lineShape)

        
    }

}


