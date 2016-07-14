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

+ (UIViewController*) SodyoScanner;
+ (void) LoadApp:(NSInteger)AppID AppToken:(NSString*)AppToken Delegate:(NSObject<SodyoSDKDelegate>*)Delegate MarkerDelegate:(NSObject<SodyoMarkerDelegate>*)MarkerDelegate;

@end

@protocol SodyoSDKDelegate

@optional
- (void) onSodyoAppLoadSuccess:(NSInteger)AppID;
- (void) onSodyoAppLoadFailed:(NSInteger)AppID error:(NSError *)error;

@end

@protocol SodyoMarkerDelegate

@optional
- (void) SodyoMarkerDetectedWithData:(NSDictionary*)Data;
- (void) SodyoLoadingUnknownMarker;

@end