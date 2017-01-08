//
//  SodyoSDKDemoViewController.m
//  SodyoNT
//
//  Created by Tomer Lavi on 27/12/2016.
//  Copyright © 2016 Sodyo. All rights reserved.
//

#import "SodyoSDKDemoViewController.h"
#import <SodyoSDK/SodyoSDK.h>

@interface SodyoSDKDemoViewController () <SodyoSDKDelegate>

@property (nonatomic, retain) IBOutlet UILabel *scanResultLabel;
@property (nonatomic, retain) IBOutlet UILabel *historySizeLabel;
@property (nonatomic, retain) IBOutlet UIButton *launchScannerButton;
@property (nonatomic, retain) IBOutlet UIButton *launchHistoryButton;

@end

@implementation SodyoSDKDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	[SodyoSDK LoadApp:3 AppToken:@"c296b77eba4525f21ba3ff8776728ba4" Delegate:self MarkerDelegate:nil];	
}

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];

	NSUInteger historySize = [SodyoSDK RecentScansCount];
	self.historySizeLabel.text = [@(historySize) stringValue];
	self.launchHistoryButton.enabled = (historySize > 0);
}

- (IBAction) launchSodyoScanner:(id)sender {
	[self.navigationController pushViewController:[SodyoSDK SodyoScanner] animated:YES];
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
