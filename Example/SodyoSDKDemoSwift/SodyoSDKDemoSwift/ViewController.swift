//
//  ViewController.swift
//  SodyoSDKDemoSwift
//
//  Created by Tomer Lavi on 14/09/2017.
//  Copyright © 2017 Sodyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SodyoMarkerDelegate, SodyoSDKDelegate {
	@IBOutlet weak private var launchScannerButton:UIButton!
	@IBOutlet weak private var launchHistoryButton:UIButton!
	@IBOutlet weak private var scanResultLabel:UILabel!
	@IBOutlet weak private var historySizeLabel:UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()

		SodyoSDK.loadApp("28e9f48c0dae4cec8d223c8331c97482", delegate: self, markerDelegate: self, presenting: self);
		launchScannerButton.isEnabled = true;
	}


	@IBAction func launchSodyoScanner(sender: AnyObject) {
		present(SodyoSDK.initSodyoScanner(), animated: true, completion: nil);
	}

	@IBAction func launchSodyoHistory(sender: AnyObject) {
		present(SodyoSDK.sodyoHistory(), animated: true, completion: nil);
	}
	
	func sodyoMarkerDetected(withData Data: [AnyHashable : Any]) {
		print("sodyoMarkerDetected(withData");
	}
	
	func onSodyoAppLoadSuccess(_ AppID: Int) {
		print("onSodyoAppLoadSuccess");
	}
	
	func onSodyoAppLoadFailed(_ AppID: Int, error: Error!) {
		print("onSodyoAppLoadError");
	}
}

