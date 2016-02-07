//
//  ApproveForRatingViewController.swift
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/7/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

import UIKit

class ApproveForRatingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var _items = [TMSimpleTouristSiteResponseModel]()
    
    @IBOutlet weak var tvItems: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tvItems.delegate = self
        self.tvItems.dataSource = self
        self.loadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier")
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        }
        
        let item = _items[indexPath.row]
        
        cell?.textLabel?.text = item.name
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        TMAlertControllerFactory.showCancelableAlertDialogWithTitle("Approve For Rating?", message: nil, uiViewController: self) { (action) in
            let item = self._items[indexPath.row]
                        
            let requester = TMRequester()
            
            requester .postJSONWithUrl("/api/TouristSites/ApproveForRating/\(item.modelId)", data: nil, andBlock: { (err, result) in
                if err != nil {
                    TMAlertControllerFactory.showAlertDialogWithTitle("Error", message: "Cannot approve this tourist site for rating at the moment. Please try again later.", uiViewController: self, andHandler: nil)
                    return
                }
                
                TMAlertControllerFactory.showAlertDialogWithTitle("Success", message: "Tourist site approved for rating.", uiViewController: self, andHandler: nil)
            })
        }
    }
    
    func loadData() {
        let requester = TMRequester()
        
        requester.getJSONWithUrl("/api/TouristSites/ForApproving") { (err, result) in
            if err != nil {
                return;
            }
            
            var mappedResult = [TMSimpleTouristSiteResponseModel]()
            
            let resultArray = result as! [NSDictionary]
            
            for item in resultArray {
                var mappedItem : TMSimpleTouristSiteResponseModel = TMSimpleTouristSiteResponseModel()
                
                do {
                    mappedItem = try TMSimpleTouristSiteResponseModel(dictionary: item as [NSObject : AnyObject])
                }
                catch _ {
                    
                }
                
                mappedResult.append(mappedItem)
                
                self._items = mappedResult
                
                self.tvItems.reloadData()
            }
        }
    }
}
