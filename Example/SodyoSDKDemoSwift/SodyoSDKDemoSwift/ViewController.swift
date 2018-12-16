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
	@IBOutlet weak private var scanResultLabel:UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()

		SodyoSDK.loadApp("28e9f48c0dae4cec8d223c8331c97482", delegate: self, markerDelegate: self, presenting: self);
		SodyoSDK.setCustomAdLabel("aaa,bbb,ccc");
		
		launchScannerButton.isEnabled = true;
	}

	func addDemoCustomView() {
		let overlay = SodyoSDK.overlayView();
		let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 200));
		label.text = "Some test text";
		label.textColor = UIColor.white;
		label.center = overlay!.center;
		overlay!.addSubview(label);
	}
	
	@IBAction func launchSodyoScanner(sender: AnyObject) {
		let sodyoScanner = SodyoSDK.initSodyoScanner();
		self.addDemoCustomView();
		present(sodyoScanner!, animated: true, completion: nil);
	}

	func sodyoMarkerDetected(withData Data: [AnyHashable : Any]) {
		print("sodyoMarkerDetected(withData \(Data)");
	}
	
	func onSodyoAppLoadSuccess(_ AppID: Int) {
		print("onSodyoAppLoadSuccess");
	}
	
	func onSodyoAppLoadFailed(_ AppID: Int, error: Error!) {
		print("onSodyoAppLoadError \(error)");
	}
	
	func sodyoError(_ error: Error!) {
		print("sodyoError \(error)");
	}
}

