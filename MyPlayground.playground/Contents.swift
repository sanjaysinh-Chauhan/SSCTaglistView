//: A UIKit based Playground for presenting user interface
  
import UIKit

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
        lineShape.fillColor = UIColor.yellow.cgColor
        lineShape.strokeColor = UIColor.brown.cgColor
        //self.layer.addSublayer(lineShape)
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 13.0, height: 13.0))
        self.addSubview(view)
        
//        view.clipsToBounds = true
        //        view.center = self.center
        
        view.layer.addSublayer(lineShape)
        
        
    }

}
let btn = CloseButton(frame: CGRect(x: 0.0, y: 0.0, width: 42.0, height: 40.0))


