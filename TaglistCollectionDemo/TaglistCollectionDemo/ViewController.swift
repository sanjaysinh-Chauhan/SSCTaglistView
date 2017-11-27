//
//  ViewController.swift
//  TaglistCollectionDemo
//
//  Created by Sanjaysinh Chauhan on 08/11/17.
//  Copyright © 2017 Sanjaysinh Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var aryTeglist = [String]()
    @IBOutlet var tagListView: TaglistCollection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        self.setupTaglistView()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setupTaglistView() {
        
        self.tagListView.setupTagCollection()
        self.tagListView.delegate = self
        
        self.tagListView.appendTag(tagName: "Men's Fashion")
        self.tagListView.appendTag(tagName: "Women's Fashion")
        self.tagListView.appendTag(tagName: "Home & Kitched")
        self.tagListView.appendTag(tagName: "Mobile & Accessories")
        self.tagListView.appendTag(tagName: "Electronics")
        self.tagListView.appendTag(tagName: "Mobile & Accessories Mobile & Accessories Mobile & Accessories Mobile & Accessories")
        self.tagListView.appendTag(tagName: "Baby, Kids & Toys")
        self.tagListView.appendTag(tagName: "Stationary")
        self.tagListView.appendTag(tagName: "Sports & Health")
        self.tagListView.appendTag(tagName: "Automotive")
        self.tagListView.appendTag(tagName: "Supermarket")
        
        self.aryTeglist = self.tagListView.copyAllTags()
        
        
        //self.tagListView.tagFont = UIFont.systemFont(ofSize: 15.0, weight: .heavy)
        
        
    }


}

extension ViewController : TagViewDelegate {
    func didSelectTag(_ indexPath: IndexPath) {
        print(self.aryTeglist[indexPath.item])
    }
    
    func removeTag(_ indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    
}


