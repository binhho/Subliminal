//
//  SLGestureRecorder.h
//  Subliminal
//
//  Created by Jeffrey Wear on 10/3/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLGesture;
typedef void (^SLGestureHandler)(SLGesture *gesture);

@interface SLGestureRecorder : NSObject

- (instancetype)initWithReferenceFrame:(CGRect)frame;

- (void)startRecordingWithHandler:(SLGestureHandler)handler;

@end
