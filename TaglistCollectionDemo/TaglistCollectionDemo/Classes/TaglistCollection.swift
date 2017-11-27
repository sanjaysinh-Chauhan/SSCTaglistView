//
//  TaglistCollection.swift
//  TaglistCollectionDemo
//
//  Created by Sanjaysinh Chauhan on 08/11/17.
//  Copyright © 2017 Sanjaysinh Chauhan. All rights reserved.
//

import UIKit
protocol TagViewDelegate: class {

    
    func didSelectTag ( _ indexPath : IndexPath)
    
}
@IBDesignable class TaglistCollection: UIView {
    
  

    @IBInspectable public var cellSpacing: CGFloat = 0.0 {
        didSet {
            self.setNeedsDisplay()
            
        }
    }
    @IBInspectable public var cellBackGroundColor : UIColor = UIColor.clear {
        didSet {
            self.setNeedsDisplay()
            
        }
    }
    
    @IBInspectable public var tagFont: UIFont = UIFont.systemFont(ofSize: 15.0) {
        didSet {
            
            self.setNeedsDisplay()

        }
    }
    
    @IBInspectable public var tagTextColor : UIColor = UIColor.clear {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var tagBackgroundColor : UIColor = UIColor.clear {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var tagBorderColor : UIColor = UIColor.clear {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var tagBorderWidht : CGFloat = 0.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable public var scrollIndicator : Bool = true {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var isDeleteEnabled : Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }

    var collectionView : UICollectionView!
    var aryTaglist = [String]()
    var delegate : TagViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
    }
    
    

    
    
    func setupTagCollection() {
        
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = self.cellSpacing
        layout.minimumInteritemSpacing = self.cellSpacing
        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.scrollDirection = .horizontal
        
        let frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: 50.0)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = scrollIndicator
        
        
        let tagCollectionNib = UINib(nibName: String(describing: TagCollectionCell.self), bundle: nil)
        collectionView!.register(tagCollectionNib, forCellWithReuseIdentifier: "Cell")
        
        collectionView.backgroundColor = UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1.0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        self.addSubview(collectionView)
        let topConstrain = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: collectionView, attribute: .top, multiplier: 1, constant: 0)
        let leftConstrain = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: collectionView, attribute: .leading, multiplier: 1, constant: 0)
        let rightConstrain = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: collectionView, attribute: .trailing, multiplier: 1, constant: 0)
        
        let heightConstraint = NSLayoutConstraint(item: collectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50.0)
        

        self.addConstraints([topConstrain, heightConstraint, leftConstrain,rightConstrain])
        
        self.collectionView.backgroundColor = self.cellBackGroundColor
        
    }
   
    func appendTag (tagNamelist : [String]) {
        for tag in tagNamelist {
            self.aryTaglist.append(tag)
        }
        self.collectionView.reloadData()
    }
    func appendTag (tagName : String) {
        self.aryTaglist.append(tagName)
        collectionView.reloadData()
    }
    
    func appendTag (tagName : String ,atIndex : Int) {
        self.aryTaglist.insert(tagName, at: atIndex)
        collectionView.reloadData()
    }
    func removeAllTags () {
        self.aryTaglist.removeAll()
        self.collectionView.reloadData()
    }
    func removeTagsAtIndex (index : Int) {
        self.aryTaglist.remove(at: index)
        self.collectionView.reloadData()
    }
    
    
    func copyAllTags () -> [String] {
        var aryTags = [String]()
        for tag in self.aryTaglist {
           aryTags.append(tag)
        }
        return aryTags
    }
    
}

extension TaglistCollection : UICollectionViewDataSource ,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.aryTaglist.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellReuserIdentifier = "Cell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuserIdentifier, for: indexPath) as! TagCollectionCell
        
        
        cell.backgroundColor = UIColor.red
        cell.arylist = self.aryTaglist
        cell.indexPath = indexPath
        cell.outerView = self
        cell.delegate = self as TagColllectionCellDelegate
        cell.configureCell()
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let w = self.aryTaglist[indexPath.row].width(withConstraintedHeight: 50.0, font: tagFont)

        return CGSize(width: w, height: 50.0)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectTag(indexPath)
    }
    
    

    
}

extension TaglistCollection : TagColllectionCellDelegate {
    func removeTagAt(indexPath: IndexPath) {
        self.removeTagsAtIndex(index: indexPath.row)
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

