//
//  SodyoSDK.h
//  SodyoSDK
//
//  Created by Tomer Lavi on 28/12/2015.
//  Copyright (c) 2015 Sodyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SodyoSDKDelegate;
@protocol SodyoMarkerDelegate;


@interface SodyoSDK : NSObject

+ (UIViewController*) initSodyoScanner;
+ (UIView*) overlayView;
+ (void) showDefaultOverlay;
+ (void) hideDefaultOverlay;
+ (UIViewController*) SodyoHistory;
+ (void) LoadApp:(NSInteger)AppID AppToken:(NSString*)AppToken Delegate:(NSObject<SodyoSDKDelegate>*)Delegate MarkerDelegate:(NSObject<SodyoMarkerDelegate>*)MarkerDelegate PresentingViewController:(UIViewController*)PresentingViewController;
+ (void) LoadApp:(NSString*)AppToken Delegate:(NSObject<SodyoSDKDelegate>*)Delegate MarkerDelegate:(NSObject<SodyoMarkerDelegate>*)MarkerDelegate PresentingViewController:(UIViewController*)PresentingViewController;
+ (NSUInteger) RecentScansCount;
+ (void) setCustomAdLabel:(NSString*)label;
+ (void) setDetectionSound:(NSString*)path;
+ (void) setUserInfo:(NSDictionary*)userInfo;
+ (void) setUserId:(NSString*)userId;
+ (void) setScannerParams:(NSDictionary*)params;
+ (void) setPresentingViewController:(UIViewController*)presentingViewController;
+ (void) performMarker:(NSString *)markerID;
+ (void) startScanning:(UIViewController*)sodyoScanner;
+ (void) stopScanning:(UIViewController*)sodyoScanner;
+ (void) startTroubleshoot:(UIViewController*)sodyoScanner;

@end

@protocol SodyoSDKDelegate

@optional
- (void) onSodyoAppLoadSuccess:(NSInteger)AppID;
- (void) onSodyoAppLoadFailed:(NSInteger)AppID error:(NSError *)error;
- (void) sodyoError:(NSError *)error;

@end

@protocol SodyoMarkerDelegate

@optional
- (void) SodyoMarkerDetectedWithData:(NSDictionary*)Data;
- (void) SodyoMarkerContent:(NSString*)markerId Data:(NSDictionary*)Data;

@end
