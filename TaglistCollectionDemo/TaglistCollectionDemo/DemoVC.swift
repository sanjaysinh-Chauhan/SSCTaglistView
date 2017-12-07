//
//  DemoVC.swift
//  TaglistCollectionDemo
//
//  Created by Sanjaysinh Chauhan on 07/12/17.
//  Copyright © 2017 Sanjaysinh Chauhan. All rights reserved.
//

import UIKit

class DemoVC: UIViewController {

    let aryTypes = ["Add tags using array" , "Add single tag"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Demo"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension DemoVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.aryTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! demoCell
        cell.lblType.text = self.aryTypes[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
