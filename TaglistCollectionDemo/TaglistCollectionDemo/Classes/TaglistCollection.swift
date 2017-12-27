//
//  TaglistCollection.swift
//  TaglistCollectionDemo
//
//  Created by Sanjaysinh Chauhan on 08/11/17.
//  Copyright © 2017 Sanjaysinh Chauhan. All rights reserved.
//

import UIKit
protocol TagViewDelegate: class {
    
    /// this method will fire automatically when tapped on tag
    ///
    /// - Parameter indexPath: return indexpath of tapped tag
    func didTaponTag ( _ indexPath : IndexPath)
    
    /// this method will fire automatically when removed perticular tag
    ///
    /// - Parameter indexPath: return indexpath of removed tag
    func didRemoveTag ( _ indexPath : IndexPath)
    
}

@IBDesignable class TaglistCollection: UIView {
    
    /// Spacing between tags
    @IBInspectable public var tagSpacing: CGFloat = 0.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    /// Cell background color
    @IBInspectable public var cellBackgroundColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.cellBackGroundColor = cellBackgroundColor
            self.setNeedsDisplay()
        }
    }
    
    /// Tag font
    @IBInspectable public var textFont: UIFont = UIFont.systemFont(ofSize: 15.0) {
        didSet {
            Theme.shared.textFont = textFont
            self.setNeedsDisplay()
            
        }
    }
    
    /// Tag text color
    @IBInspectable public var tagTextColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.tagTextColor = tagTextColor
            self.setNeedsDisplay()
        }
    }
    
    /// Tag backgound color
    @IBInspectable public var tagBackgroundColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.tagBackgroundColor = tagBackgroundColor
            self.setNeedsDisplay()
        }
    }
    
    
    /// Tag border color
    @IBInspectable public var tagBorderColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.tagBorderColor = tagBorderColor
            self.setNeedsDisplay()
        }
    }
    
    /// Tag border width
    @IBInspectable public var tagBorderWidth : CGFloat = 0.0 {
        didSet {
            Theme.shared.tagBorderWidth = tagBorderWidth
            self.setNeedsDisplay()
        }
    }
    
    /// Tag shadow color
    @IBInspectable public var shadowColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.tagShadowColor = shadowColor
            self.setNeedsDisplay()
        }
    }
    
    /// Tag shadow opacity
    @IBInspectable public var shadowOpacity : Float = 0.5 {
        didSet {
            Theme.shared.tagShadowOpacity = shadowOpacity
            self.setNeedsDisplay()
        }
    }
    
    /// Tag shadow radius
    @IBInspectable public var shadowRadius : CGFloat = 2.0  {
        didSet {
            Theme.shared.tagShadowRadius = shadowRadius
            self.setNeedsDisplay()
        }
    }
    
    /// Enable disable shadow
    @IBInspectable public var isShadowEnabled : Bool = false {
        didSet {
            Theme.shared.isShadowEnabled = isShadowEnabled
            self.setNeedsDisplay()
        }
    }
    
    /// Show/Hide scroll indicator
    @IBInspectable public var scrollIndicator : Bool = true {
        didSet {
            
            self.setNeedsDisplay()
        }
    }
    
    /// Allow single selection
    @IBInspectable public var allowSingleSelection : Bool = false {
        didSet {
            Theme.shared.allowSingleSelection = allowSingleSelection
            self.setNeedsDisplay()
        }
    }
    
    /// Allow multiple selection
    @IBInspectable public var allowMultipleSelection : Bool = false {
        didSet {
            Theme.shared.allowMultipleSelection = allowMultipleSelection
            self.setNeedsDisplay()
        }
    }
    
    //MARK: - closeIcon properties -
    
    /// Show hide delete buttons
    @IBInspectable public var isDeleteEnabled : Bool = false {
        didSet {
            Theme.shared.isDeleteEnabled = isDeleteEnabled
            self.setNeedsDisplay()
        }
    }
    
    /// Close icon tint color
    @IBInspectable public var closeIconTint : UIColor = UIColor.white {
        didSet {
            Theme.shared.closeIconTint = closeIconTint
            self.setNeedsDisplay()
        }
    }
    
    /// Close icon width
    @IBInspectable public var closeIconWidth : CGFloat = 0.0 {
        didSet {
            Theme.shared.closeIconWidth = closeIconWidth
            self.setNeedsDisplay()
        }
    }
    
    /// Close icon height
    @IBInspectable public var closeIconHeight : CGFloat = 0.0 {
        didSet {
            Theme.shared.closeIconHeight = closeIconHeight
            self.setNeedsDisplay()
        }
    }
    
    
    //MARK: - Tag selection properties -
    
    /// Selected tag backgound color
    @IBInspectable public var selectionBackgroundColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.selectionColor = selectionBackgroundColor
            self.setNeedsDisplay()
        }
    }
    
    /// Selected tag text color
    @IBInspectable public var selectionTagTextColor : UIColor = UIColor.clear {
        didSet {
            Theme.shared.selectionTagTextColor = selectionTagTextColor
            self.setNeedsDisplay()
        }
    }
    
    /// Selected tag close icon tag
    @IBInspectable public var selectionCloseIconTint : UIColor = UIColor.white {
        didSet {
            Theme.shared.selectionCloseIconTint = selectionCloseIconTint
            self.setNeedsDisplay()
        }
    }
    
    var collectionView : UICollectionView!
    
    /// All tag names
    var tagNames = [String]()
    
    /// Array for selected unselected tag index
    var selectedTagAck = [Bool]()
    
    var delegate : TagViewDelegate?
    
    /// Init tag view
    ///
    /// - Parameter frame: frame of rect
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
        
        // 1 - mask constrain true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // 2 - setup flowlayout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = self.tagSpacing
        layout.minimumInteritemSpacing = self.tagSpacing
        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.scrollDirection = .horizontal
        
        // 3 - set collectionview layout
        let frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: 70.0)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = scrollIndicator
        
        // 4 - register nib
        let tagCollectionNib = UINib(nibName: String(describing: TagCollectionCell.self), bundle: nil)
        collectionView!.register(tagCollectionNib, forCellWithReuseIdentifier: "Cell")
        
        // 5 - set datasource delegate and colors
        collectionView.backgroundColor = UIColor.red
        collectionView.backgroundColor = self.cellBackgroundColor
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 6 - add collection view to super view
        self.addSubview(collectionView)
        
        // 7 - add constraint
        let topConstrain = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: collectionView, attribute: .top, multiplier: 1, constant: 0)
        let leftConstrain = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: collectionView, attribute: .leading, multiplier: 1, constant: 0)
        let rightConstrain = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: collectionView, attribute: .trailing, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: collectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50.0)
        self.addConstraints([topConstrain, heightConstraint, leftConstrain,rightConstrain])
        
        
    }
    
    /// Append multiple tags
    ///
    /// - Parameter tagNamelist: pass array of tags
    func appendTag (tagNamelist : [String]) {
        for tag in tagNamelist {
            self.tagNames.append(tag)
            self.selectedTagAck.append(false)
        }
        self.collectionView.reloadData()
        //self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    /// Append single tag
    ///
    /// - Parameter tagName: tag string
    func appendTag (tagName : String) {
        self.tagNames.append(tagName)
        self.selectedTagAck.append(false)
        self.collectionView.reloadData()
        //self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    /// Append tag at specific index
    ///
    /// - Parameters:
    ///   - tagName: name of tag
    ///   - atIndex: index of tag
    func appendTag (tagName : String ,atIndex : Int) {
        self.tagNames.insert(tagName, at: atIndex)
        self.selectedTagAck.insert(false, at: atIndex)
        self.collectionView.reloadData()
    }
    
    /// Remove all tags
    func removeAllTags () {
        
        self.tagNames.removeAll()
        self.selectedTagAck.removeAll()
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.layoutIfNeeded()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    /// Remove tag at specific index
    ///
    /// - Parameter index: index of tag
    func removeTagsAtIndex (index : Int) {
        
        if index < self.tagNames.count {
            self.tagNames.remove(at: index)
        }
        if self.selectedTagAck.count < index {
            self.selectedTagAck.remove(at: index)
        }
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.layoutIfNeeded()
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    /// Copy all tags
    ///
    /// - Returns: copy of current tag list
    func copyAllTags () -> [String] {
        var aryTags = [String]()
        for tag in self.tagNames {
            aryTags.append(tag)
        }
        return aryTags
    }
    
    /// Copy selected tag from list
    ///
    /// - Returns: copy of selected tag list
    func copySelectedTags () -> [String] {
        
        var aryTags = [String]()
        for (index , _) in self.tagNames.enumerated() {
            if(self.selectedTagAck[index] == true) {
                aryTags.append(self.tagNames[index])
            }
        }
        return aryTags
    }
    
    /// Copy unselected tag from list
    ///
    /// - Returns: copy of unselected tag list
    func copyUnselectedTags () -> [String] {
        var aryTags = [String]()
        for (index , _) in self.tagNames.enumerated() {
            if(self.selectedTagAck[index] == false) {
                aryTags.append(self.tagNames[index])
            }
        }
        return aryTags
    }
    
}

//MARK: - collection view datasource and delegate -
extension TaglistCollection : UICollectionViewDataSource ,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
    // 1.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tagNames.count
    }
    
    // 2.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellReuserIdentifier = "Cell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuserIdentifier, for: indexPath) as! TagCollectionCell
        cell.indexPath = indexPath
        if indexPath.item < self.tagNames.count {
            
            cell.objTagName = self.tagNames[indexPath.item]
            cell.isCellSelected = self.selectedTagAck[indexPath.item]
            cell.delegate = self as TagColllectionCellDelegate
            cell.configureCell()
        }
        return cell
    }
    
    // 3.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item < self.tagNames.count {
            let w = self.tagNames[indexPath.item].width(withConstraintedHeight: 70.0, font: textFont)
            
            return CGSize(width: w, height: 50.0)
        }
        return CGSize(width: 40, height: 50.0)
        
    }
    
    // 4.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTaponTag(indexPath)
        if(self.allowMultipleSelection == true) {
            self.selectedTagAck[indexPath.item] = !self.selectedTagAck[indexPath.item]
        }
        else if(self.allowSingleSelection == true) {
            self.selectedTagAck[indexPath.item] = !self.selectedTagAck[indexPath.item]
            for (index , _) in self.selectedTagAck.enumerated() {
                if (indexPath.item != index) {
                    self.selectedTagAck[index] = false
                }
            }
        }
        self.collectionView.reloadData()
    }
}

//MARK: - tag list delegate -
extension TaglistCollection : TagColllectionCellDelegate {
    func removeTagAt(indexPath: IndexPath) {
        
        self.removeTagsAtIndex(index: indexPath.item)
        self.delegate?.didRemoveTag(indexPath)
    }
}



