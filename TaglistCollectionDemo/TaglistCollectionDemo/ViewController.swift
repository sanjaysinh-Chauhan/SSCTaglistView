//
//  ViewController.swift
//  TaglistCollectionDemo
//
//  Created by Sanjaysinh Chauhan on 08/11/17.
//  Copyright © 2017 Sanjaysinh Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtTag: UITextField!
    @IBOutlet var tbllist: UITableView!
    var aryTeglist = [String]()
    var aryCopyTags = [String]()
    
    @IBOutlet var tagListView: TaglistCollection!
    
    @IBOutlet var btnClose: CloseButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Features"
        
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
        
        self.tagListView.appendTag(tagName: "Auto")
        self.tagListView.appendTag(tagName: "Super")
        
        self.aryTeglist = self.tagListView.copyAllTags()
        
        
        self.tagListView.textFont = UIFont.systemFont(ofSize: 15.0, weight: .heavy)
        
    }

    @IBAction func copySelectedAction(_ sender: UIButton) {
        self.aryCopyTags.removeAll()
        self.aryCopyTags = self.tagListView.copySelectedTags()
        self.tbllist.reloadData()
        
    }
    @IBAction func copyUnselectedAction(_ sender: UIButton) {
        self.aryCopyTags.removeAll()
        self.aryCopyTags = self.tagListView.copyUnselectedTags()
        self.tbllist.reloadData()
    }
    @IBAction func addTagAction(_ sender: UIButton) {
        let strText = self.txtTag.text?.trimmingCharacters(in: .whitespaces)
        if(strText?.count != 0){
            self.tagListView.appendTag(tagName: strText!)
            self.aryTeglist.append(strText!)
            self.txtTag.text = ""
        }
        
        
    }
    
}

extension ViewController : TagViewDelegate {
    func didRemoveTag(_ indexPath: IndexPath) {
        print("RemoveIndexPath==\(indexPath)")
    }
    
    func didTaponTag(_ indexPath: IndexPath) {
        print("Tag tapped: \(self.aryTeglist[indexPath.item])")
    }

}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return textField.resignFirstResponder()
    }
}

extension ViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.aryCopyTags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! demoCell
        cell.lblType.text = self.aryCopyTags[indexPath.row]
        return cell
    }
}
