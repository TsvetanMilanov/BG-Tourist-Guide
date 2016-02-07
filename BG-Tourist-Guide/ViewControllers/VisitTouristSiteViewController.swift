//
//  VisitTouristSiteViewController.swift
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/7/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

import UIKit
import AVFoundation
import QRCodeReader

class VisitTouristSiteViewController: UIViewController, QRCodeReaderViewControllerDelegate  {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnScanQRCodeTap(sender: AnyObject) {
        let reader: QRCodeReaderViewController = {
            let builder = QRCodeViewControllerBuilder { builder in
                builder.reader = QRCodeReader(metadataObjectTypes: [AVMetadataObjectTypeQRCode])
                builder.showTorchButton = true
            }
            
            return QRCodeReaderViewController(builder: builder)
        }()
        
        if QRCodeReader.supportsMetadataObjectTypes() {
            reader.modalPresentationStyle = .FormSheet
            reader.delegate               = self
            
            reader.completionBlock = { (result: QRCodeReaderResult?) in
                if let result = result {
                    print("Completion with result: \(result.value) of type \(result.metadataType)")
                }
            }
            
            presentViewController(reader, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Reader not supported by the current device", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func reader(reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        self.dismissViewControllerAnimated(true, completion: { [weak self] in
            let requester = TMRequester()
            let loadingBar = TMActivityIndicatorFactory.activityIndicatorWithParentView(self!.view)
            
            requester.postJSONWithUrl(result.value, data: nil, andBlock: { (err, result) in
                loadingBar.stopAnimating()
                if err != nil {
                    TMAlertControllerFactory.showAlertDialogWithTitle("Error", message: "There was an error on the server. Please try again later.", uiViewController: self!, andHandler: nil)
                    return;
                }
                
                TMAlertControllerFactory.showAlertDialogWithTitle("Success", message: "The tourist site was visited successsfully.", uiViewController: self!, andHandler: nil)
            })
            })
    }
    
    func readerDidCancel(reader: QRCodeReaderViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func btnEnterCodeTap(sender: AnyObject) {
        TMAlertControllerFactory.showTextInputDialogWithTitle("Enter the code:", controller: self) { (text) in
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
