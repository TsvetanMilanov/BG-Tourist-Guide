//
//  VisitTouristSiteViewController.swift
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/7/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

import UIKit

class VisitTouristSiteViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnScanQRCodeTap(sender: AnyObject) {

    }
    
    @IBAction func btnEnterCodeTap(sender: AnyObject) {
        TMAlertControllerFactory.showEnterCodeDialogWithUiViewController(self) { (text) in
            let requester = TMRequester()
            
            let loadingBar = TMActivityIndicatorFactory.activityIndicatorWithParentView(self.view)
            
            loadingBar.startAnimating()
            
            requester.postJSONWithUrl("/api/TouristSites/Visit?id=\(text)", data: nil, andBlock: { (err, result) in
                loadingBar.stopAnimating()
                if err != nil {
                    TMAlertControllerFactory.showAlertDialogWithTitle("Error", message: "There was an error on the server. Please try again later.", uiViewController: self, andHandler: nil)
                    return;
                }
                
                TMAlertControllerFactory.showAlertDialogWithTitle("Success", message: "The tourist site was visited successsfully.", uiViewController: self, andHandler: nil)
            })
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
