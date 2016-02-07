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
import CoreLocation

class VisitTouristSiteViewController: UIViewController, QRCodeReaderViewControllerDelegate, CLLocationManagerDelegate  {
    var locationManager : CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    @IBAction func btnScanQRCodeTap(sender: AnyObject) {
        
        if (UIImagePickerController.isSourceTypeAvailable(.Camera))
        {
            let reader: QRCodeReaderViewController = {
                let builder = QRCodeViewControllerBuilder { builder in
                    builder.reader = QRCodeReader(metadataObjectTypes: [AVMetadataObjectTypeQRCode])
                    builder.showTorchButton = true
                }
                
                return QRCodeReaderViewController(builder: builder)
            }()
            
            if QRCodeReader.supportsMetadataObjectTypes() {
                reader.modalPresentationStyle = .FormSheet
                reader.delegate = self
                
                reader.completionBlock = { (result: QRCodeReaderResult?) in
                    if let result = result {
                        print("Completion with result: \(result.value) of type \(result.metadataType)")
                    }
                }
                
                presentViewController(reader, animated: true, completion: nil)
            }
            else {
                TMAlertControllerFactory.showAlertDialogWithTitle("Error", message: "Your device does not have a camera. Please ask for the code of the tourist site and enter it.", uiViewController: self, andHandler: nil);
            }
            
        }
        else {
            TMAlertControllerFactory.showAlertDialogWithTitle("Error", message: "Your device does not have a camera. Please ask for the code of the tourist site and enter it.", uiViewController: self, andHandler: nil)
        }
    }
    
    @IBAction func btnEnterCodeTap(sender: AnyObject) {
        let weakSelf = self
        TMAlertControllerFactory.showTextInputDialogWithTitle("Enter the code:", controller: self) { (text) in
            weakSelf.locationManager.requestWhenInUseAuthorization()
            weakSelf.locationManager.requestLocation()
            
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
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print("\(newLocation)")
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("\(error)")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            print("\(location)")
        }
    }
}
