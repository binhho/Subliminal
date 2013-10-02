//
//  SLElementCustomGestureTest.m
//  Subliminal
//
//  Created by Jeffrey Wear on 10/1/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"
#import <Subliminal/SLGestureRecorder+SLUIAElement.h>
#import <Subliminal/SLUIAElement+CustomGestures.h>

@interface SLElementCustomGestureTest : SLIntegrationTest

@end

@implementation SLElementCustomGestureTest

+ (NSString *)testCaseViewControllerClassName {
    return @"SLElementCustomGestureTestViewController";
}

- (void)focus_testCustomGesture {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(gestureRecorded:)
                                                 name:@"SLGestureRecordedNotification" object:nil];

    while (YES) {
        SLAskApp(clearGesture);

        BOOL recordNewGesture = NO;
        NSString *const gesturePath = @"/Users/jeffreywear/Desktop/test.slgesture";

        SLGesture *gesture = nil;
        if (recordNewGesture) {
            SLLog(@"Waiting for gesture to be recorded...");

            gesture = [SLGestureRecorder recordGestureWithElement:[SLWindow mainWindow]];
            [NSKeyedArchiver archiveRootObject:gesture toFile:gesturePath];

            // wait to look at gesture
            [self wait:3.0];
        } else {
            gesture = [NSKeyedUnarchiver unarchiveObjectWithFile:gesturePath];
        }

        SLLog(@"Playing gesture back.");
        SLAskApp(clearGesture);
        [[SLWindow mainWindow] gesture:gesture];

        [self wait:3.0];
    }
}

@end
