//
//  TaglistCollection.swift
//  TaglistCollectionDemo
//
//  Created by Sanjaysinh Chauhan on 08/11/17.
//  Copyright © 2017 Sanjaysinh Chauhan. All rights reserved.
//

import UIKit
protocol TagViewDelegate: class {

    
    func didTaponTag ( _ indexPath : IndexPath)
    func didRemoveTag ( _ indexPath : IndexPath)
    
}
@IBDesignable class TaglistCollection: UIView {
    
  
    @IBInspectable public var cellSpacing: CGFloat = 0.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var cellBackGroundColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.cellBackGroundColor = cellBackGroundColor
            self.setNeedsDisplay()
        }
    }

    @IBInspectable public var textFont: UIFont = UIFont.systemFont(ofSize: 15.0) {
        didSet {
            Theme.shared.textFont = textFont
            self.setNeedsDisplay()

        }
    }
    
    @IBInspectable public var tagTextColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.tagTextColor = tagTextColor
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var tagBackgroundColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.tagBackgroundColor = tagBackgroundColor
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var tagBorderColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.tagBorderColor = tagBorderColor
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var tagBorderWidht : CGFloat = 0.0 {
        didSet {
            Theme.shared.tagBorderWidht = tagBorderWidht
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var shadowColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.tagShadowColor = shadowColor
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var shadowOpacity : Float = 0.5 {
        didSet {
            Theme.shared.tagShadowOpacity = shadowOpacity
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var shadowRadius : CGFloat = 2.0  {
        didSet {
            Theme.shared.tagShadowRadius = shadowRadius
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var isShadowEnabled : Bool = false {
        didSet {
            Theme.shared.isShadowEnabled = isShadowEnabled
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var scrollIndicator : Bool = true {
        didSet {
            
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var allowSingleSelection : Bool = false {
        didSet {
            Theme.shared.allowSingleSelection = allowSingleSelection
            self.setNeedsDisplay()
        }
    }
    @IBInspectable public var allowMultipleSelection : Bool = false {
        didSet {
            Theme.shared.allowMultipleSelection = allowMultipleSelection
            self.setNeedsDisplay()
        }
    }
    
    
    /// CloseIcon properties
    @IBInspectable public var isDeleteEnabled : Bool = false {
        didSet {
            Theme.shared.isDeleteEnabled = isDeleteEnabled
            self.setNeedsDisplay()
        }
    }
    @IBInspectable public var closeIconTint : UIColor = UIColor.white {
        didSet {
            Theme.shared.closeIconTint = closeIconTint
            self.setNeedsDisplay()
        }
    }
    @IBInspectable public var closeIconWidht : CGFloat = 0.0 {
        didSet {
            Theme.shared.closeIconWidth = closeIconWidht
            self.setNeedsDisplay()
        }
    }
    @IBInspectable public var closeIconHeight : CGFloat = 0.0 {
        didSet {
            Theme.shared.closeIconHeight = closeIconHeight
            self.setNeedsDisplay()
        }
    }
    
    
    /// Tag selection properties
    @IBInspectable public var selectionBackgroundColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.selectionColor = selectionBackgroundColor
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var selectionTagTextColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.selectionTagTextColor = selectionTagTextColor
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var selectionCloseIconTint : UIColor = UIColor.white {
        didSet {
            Theme.shared.selectionCloseIconTint = selectionCloseIconTint
            self.setNeedsDisplay()
        }
    }
    
    var collectionView : UICollectionView!
    var aryTaglist = [String]()
    var arySelectedTag = [Bool]()
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
        
        let frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: 70.0)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = scrollIndicator
        
        
        let tagCollectionNib = UINib(nibName: String(describing: TagCollectionCell.self), bundle: nil)
        collectionView!.register(tagCollectionNib, forCellWithReuseIdentifier: "Cell")
        
        collectionView.backgroundColor = UIColor.red
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
            self.arySelectedTag.append(false)
        }
        self.collectionView.reloadData()
        
        
    }
    func appendTag (tagName : String) {
        
        self.aryTaglist.append(tagName)
        self.arySelectedTag.append(false)
        self.collectionView.reloadData()

    }
    
    func appendTag (tagName : String ,atIndex : Int) {
        self.aryTaglist.insert(tagName, at: atIndex)
        self.arySelectedTag.insert(false, at: atIndex)
        self.collectionView.reloadData()
        
    }
    func removeAllTags () {
        self.aryTaglist.removeAll()
        self.arySelectedTag.removeAll()
        self.collectionView.reloadData()
    }
    func removeTagsAtIndex (index : Int) {
        self.aryTaglist.remove(at: index)
        self.arySelectedTag.remove(at: index)
        self.collectionView.reloadData()
        
    }
    
    
    func copyAllTags () -> [String] {
        var aryTags = [String]()
        for tag in self.aryTaglist {
           aryTags.append(tag)
        }
        return aryTags
    }
    
    func copySelectedTags () -> [String] {
        var aryTags = [String]()
        for (index , _) in self.aryTaglist.enumerated() {
            if(self.arySelectedTag[index] == true) {
                aryTags.append(self.aryTaglist[index])
            }
        }
        return aryTags
    }
    
    func copyUnselectedTags () -> [String] {
        var aryTags = [String]()
        for (index , _) in self.aryTaglist.enumerated() {
            if(self.arySelectedTag[index] == false) {
                aryTags.append(self.aryTaglist[index])
            }
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
        cell.indexPath = indexPath
        cell.objTagName = self.aryTaglist[indexPath.item]
        
        cell.isCellSelected = self.arySelectedTag[indexPath.item]
        cell.delegate = self as TagColllectionCellDelegate
        
        cell.configureCell()
        
        return cell

    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let w = self.aryTaglist[indexPath.item].width(withConstraintedHeight: 70.0, font: textFont)

        return CGSize(width: w, height: 50.0)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTaponTag(indexPath)
        
        if(self.allowMultipleSelection == true) {
            
            self.arySelectedTag[indexPath.item] = !self.arySelectedTag[indexPath.item]
        }
        else if(self.allowSingleSelection == true) {
            
            self.arySelectedTag[indexPath.item] = !self.arySelectedTag[indexPath.item]
            
            for (index , _) in self.arySelectedTag.enumerated() {
                if (indexPath.item != index) {
                    self.arySelectedTag[index] = false
                }
            }
            
        }
        self.collectionView.reloadData()
        
    }
    
    

    
}

extension TaglistCollection : TagColllectionCellDelegate {
    func removeTagAt(indexPath: IndexPath) {
        
        self.delegate?.didRemoveTag(indexPath)
        self.removeTagsAtIndex(index: indexPath.item)
        
        
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


