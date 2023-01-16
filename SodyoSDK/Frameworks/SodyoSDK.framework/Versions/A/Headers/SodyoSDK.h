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

typedef enum {
	SodyoModeNormal,
	SodyoModeTroubleshoot
} SodyoMode;

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
+ (void) setDynamicProfileValue:(NSString*)key value:(NSObject*)value;
+ (void) addScannerParams:(NSString*)key value:(NSString*)value;
+ (void) setScannerParams:(NSDictionary*)params;
+ (void) setPresentingViewController:(UIViewController*)presentingViewController;
+ (void) performMarker:(NSString *)markerID;
+ (void) performMarker:(NSString *)markerID customProperties:(NSDictionary*)customProperties;
+ (void) startScanning:(UIViewController*)sodyoScanner;
+ (void) stopScanning:(UIViewController*)sodyoScanner;
+ (void) startTroubleshoot:(UIViewController*)sodyoScanner;
+ (SodyoMode) getMode:(UIViewController*)sodyoScanner;
+ (void) setMode:(UIViewController*)sodyoScanner mode:(SodyoMode)mode;

@end

@protocol SodyoSDKDelegate

@optional
- (void) onSodyoAppLoadSuccess:(NSInteger)AppID;
- (void) onSodyoAppLoadFailed:(NSInteger)AppID error:(NSError *)error;
- (void) sodyoError:(NSError *)error;
- (void) onSodyoEvent:(NSString*)eventName eventData:(NSString*)eventData;
- (void) onModeChange:(SodyoMode)from to:(SodyoMode)to;
@end

@protocol SodyoMarkerDelegate

@optional
- (void) SodyoMarkerDetectedWithData:(NSDictionary*)Data;
- (void) SodyoMarkerContent:(NSString*)markerId Data:(NSDictionary*)Data;

@end
