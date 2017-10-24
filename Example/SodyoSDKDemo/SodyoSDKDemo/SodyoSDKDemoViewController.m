//
//  SodyoSDKDemoViewController.m
//  SodyoNT
//
//  Created by Tomer Lavi on 27/12/2016.
//  Copyright © 2016 Sodyo. All rights reserved.
//

#import "SodyoSDKDemoViewController.h"
#import <SodyoSDK/SodyoSDK.h>

@interface SodyoSDKDemoViewController () <SodyoSDKDelegate, SodyoMarkerDelegate>

@property (nonatomic, retain) IBOutlet UILabel *scanResultLabel;
@property (nonatomic, retain) IBOutlet UILabel *historySizeLabel;
@property (nonatomic, retain) IBOutlet UIButton *launchScannerButton;
@property (nonatomic, retain) IBOutlet UIButton *launchHistoryButton;

@end

@implementation SodyoSDKDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	[SodyoSDK LoadApp:@"28e9f48c0dae4cec8d223c8331c97482" Delegate:self MarkerDelegate:self PresentingViewController:self];
}

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];

	NSUInteger historySize = [SodyoSDK RecentScansCount];
	self.historySizeLabel.text = [@(historySize) stringValue];
	self.launchHistoryButton.enabled = (historySize > 0);
}

- (IBAction) launchSodyoScanner:(id)sender {
	[self presentViewController:[SodyoSDK initSodyoScanner] animated:YES completion:nil];
}

- (IBAction) launchSodyoHistory:(id)sender {
	[self.navigationController pushViewController:[SodyoSDK SodyoHistory] animated:YES];
}

#pragma mark - SodyoSDKDelegate
- (void) onSodyoAppLoadSuccess:(NSInteger)AppID {
	self.launchScannerButton.enabled = YES;
}

- (void) onSodyoAppLoadFailed:(NSInteger)AppID error:(NSError *)error {
	NSLog(@"Failed loading Sodyo: %@", error);
}

@end
