//
//  SodyoSDKDemoViewController.m
//  SodyoNT
//
//  Created by Tomer Lavi on 27/12/2016.
//  Copyright © 2016 Sodyo. All rights reserved.
//

#import "SodyoSDKDemoViewController.h"
#import <SodyoSDK/SodyoSDK.h>

@interface SodyoSDKDemoViewController () <SodyoSDKDelegate, SodyoMarkerDelegate> {
	UIViewController *sodyoScanner;
}

@property (nonatomic, retain) IBOutlet UILabel *scanResultLabel;
@property (nonatomic, retain) IBOutlet UIButton *launchScannerButton;

@end

@implementation SodyoSDKDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	[SodyoSDK LoadApp:@"28e9f48c0dae4cec8d223c8331c97482" Delegate:self MarkerDelegate:self PresentingViewController:nil];
	//Using present
//	[SodyoSDK LoadApp:@"28e9f48c0dae4cec8d223c8331c97482" Delegate:self MarkerDelegate:self PresentingViewController:self];
}

- (void) addDemoCustomView {
	UIView *overlay = [SodyoSDK overlayView];
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
	label.text = @"Hello world";
	label.textColor = [UIColor whiteColor];
	label.center = overlay.center;
	[overlay addSubview:label];
}

- (IBAction) launchSodyoScanner:(id)sender {
	[SodyoSDK setCustomAdLabel:@"label1,label2"];
	sodyoScanner = [SodyoSDK initSodyoScanner];

	[self addDemoCustomView];
	[self.navigationController pushViewController:sodyoScanner animated:NO];
//Using present
//	[self presentViewController:sodyoScanner animated:YES completion:nil];
}

#pragma mark - SodyoSDKDelegate
- (void) onSodyoAppLoadSuccess:(NSInteger)AppID {
	self.launchScannerButton.enabled = YES;
}

- (void) onSodyoAppLoadFailed:(NSInteger)AppID error:(NSError *)error {
	NSLog(@"Failed loading Sodyo: %@", error);
}

- (void) sodyoError:(NSError *)error {
	dispatch_async(dispatch_get_main_queue(), ^{
		NSLog(@"sodyoError: %@", error.userInfo[@"NSLocalizedDescription"]);
		[self dismissViewControllerAnimated:YES completion:nil];
	});
}

- (void) SodyoMarkerDetectedWithData:(NSDictionary*)Data {
	self.scanResultLabel.text = Data[@"sodyoMarkerData"];
	NSLog(@"SodyoMarkerDetectedWithData: %@", Data[@"sodyoMarkerData"]);
}
@end
